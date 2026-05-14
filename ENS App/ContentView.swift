import SwiftUI
 
// MARK: - Language Manager
 
class LanguageManager: ObservableObject {
    @Published var currentLanguage: String = "English"
    
    let translations: [String: [String: String]] = [
        "English": [
            "adminLogin": "Admin Login",
            "familyLogin": "Family Login",
            "language": "Language",
            "adminPage": "Admin Panel",
            "familyPage": "Inventory",
            "loading": "Loading inventory...",
            "failedLoad": "Failed to load inventory",
            "requestItem": "Need something? Email us to request an item:",
            "requestEmail": "Request an Item",
            "openSheet": "Open Inventory Sheet",
            "editSheet": "Edit the spreadsheet directly to update inventory",
            "itemName": "Item",
            "category": "Category",
            "quantity": "Qty",
            "inStock": "In Stock",
            "lowStock": "Low Stock",
            "outOfStock": "Out of Stock",
            "pullRefresh": "Pull to refresh",
            "adminPanel": "Admin Panel",
            "retry": "Retry"
        ],
        "Spanish": [
            "adminLogin": "Inicio Admin",
            "familyLogin": "Inicio Familia",
            "language": "Idioma",
            "adminPage": "Panel Admin",
            "familyPage": "Inventario",
            "loading": "Cargando inventario...",
            "failedLoad": "Error al cargar inventario",
            "requestItem": "¿Necesita algo? Envíenos un correo para solicitar un artículo:",
            "requestEmail": "Solicitar un artículo",
            "openSheet": "Abrir Hoja de Inventario",
            "editSheet": "Edite la hoja de cálculo directamente para actualizar el inventario",
            "itemName": "Artículo",
            "category": "Categoría",
            "quantity": "Cant",
            "inStock": "En Stock",
            "lowStock": "Stock Bajo",
            "outOfStock": "Agotado",
            "pullRefresh": "Jalar para actualizar",
            "adminPanel": "Panel de Admin",
            "retry": "Reintentar"
        ],
        "Somali": [
            "adminLogin": "Galitaanka Admin",
            "familyLogin": "Galitaanka Qoyska",
            "language": "Luqadda",
            "adminPage": "Xafiiska Admin",
            "familyPage": "Kaydka",
            "loading": "Rarida kaydka...",
            "failedLoad": "Waxaa ku guuldareystay rarida kaydka",
            "requestItem": "Ma u baahan tahay wax? Noo dir email si aad u codsato shay:",
            "requestEmail": "Codsashada shay",
            "openSheet": "Fur Xaashida Kaydka",
            "editSheet": "Tifaftir xaashida si toos ah si loo cusboonaysiiyo kaydka",
            "itemName": "Shay",
            "category": "Qaybta",
            "quantity": "Tiro",
            "inStock": "Kaydka Ku Jira",
            "lowStock": "Kayd Yar",
            "outOfStock": "Ka Maqan",
            "pullRefresh": "Jiid si aad u cusboonaysiisonoysato",
            "adminPanel": "Xafiiska Admin",
            "retry": "Isku day mar kale"
        ]
    ]
    
    func text(_ key: String) -> String {
        return translations[currentLanguage]?[key] ?? key
    }
}
 
// MARK: - Inventory Model
 
struct InventoryItem: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let quantity: Int
    let status: String
}
 
// MARK: - Inventory View Model
 
class InventoryViewModel: ObservableObject {
    @Published var items: [InventoryItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // ⚠️ REPLACE THESE WITH YOUR OWN VALUES
    let apiKey = "AIzaSyBFobpx36VoMI1EDyPET4apHiWLlzNL-Ds"
    let spreadsheetID = "1wUnJMRW70nGU0XmMYyYja_Crmn3_rMttwVTG--HhpHo"
    let range = "Sheet1!A2:D100"
    
    func fetchInventory() {
        isLoading = true
        errorMessage = nil
        
        let urlString = "https://sheets.googleapis.com/v4/spreadsheets/\(spreadsheetID)/values/\(range)?key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false

                if let error = error {
                    self.errorMessage = error.localizedDescription
                    print("❌ Network error: \(error.localizedDescription)")
                    return
                }

                // Print EVERYTHING Google sends back
                if let data = data, let raw = String(data: data, encoding: .utf8) {
                    print("🔍 RAW RESPONSE: \(raw)")
                }

                if let httpResponse = response as? HTTPURLResponse {
                    print("📡 HTTP STATUS: \(httpResponse.statusCode)")
                }

                guard let data = data,
                      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let rows = json["values"] as? [[String]] else {
                    self.errorMessage = "Failed to load inventory"
                    return
                }

                self.items = rows.compactMap { row in
                    guard row.count >= 4 else { return nil }
                    return InventoryItem(
                        name: row[0],
                        category: row[1],
                        quantity: Int(row[2]) ?? 0,
                        status: row[3]
                    )
                }
            }
        }.resume()
    }
}
 
// MARK: - Admin View
 
struct AdminView: View {
    @ObservedObject var languageManager: LanguageManager
    
    // ⚠️ REPLACE WITH YOUR SPREADSHEET ID
    let spreadsheetID = "1wUnJMRW70nGU0XmMYyYja_Crmn3_rMttwVTG--HhpHo"
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "person.badge.key.fill")
                .font(.system(size: 60))
                .foregroundColor(Color(red: 1, green: 0.66, blue: 0.66))
                .padding(.top, 40)
            
            Text(languageManager.text("adminPanel"))
                .font(.largeTitle.bold())
            
            Divider()
            
            VStack(spacing: 16) {
                // Open Google Sheet — opens in Safari (new tab)
                Button(action: {
                    if let url = URL(string: "https://docs.google.com/spreadsheets/d/\(spreadsheetID)/edit") {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }) {
                    HStack {
                        Image(systemName: "tablecells.fill")
                        Text(languageManager.text("openSheet"))
                            .font(.headline)
                        Spacer()
                        Image(systemName: "arrow.up.right.square")
                            .font(.subheadline)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0, green: 0.53, blue: 1))
                    .cornerRadius(12)
                }
                
                Text(languageManager.text("editSheet"))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .navigationTitle(languageManager.text("adminPage"))
    }
}
 
// MARK: - Family View
 
struct FamilyView: View {
    @ObservedObject var languageManager: LanguageManager
    @StateObject var viewModel = InventoryViewModel()
    @Environment(\.openURL) var openURL
    // ⚠️ REPLACE WITH YOUR SCHOOL EMAIL ADDRESS
    let schoolEmail = "ephs@school.com"
    // ⚠️ REPLACE WITH YOUR SCHOOL NAME (used in email subject)
    let schoolName = "Eden Prairie High School"
    
    var body: some View {
        VStack(spacing: 0) {
            if viewModel.isLoading {
                Spacer()
                ProgressView(languageManager.text("loading"))
                    .padding()
                Spacer()
                
            } else if let error = viewModel.errorMessage {
                Spacer()
                VStack(spacing: 12) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.orange)
                    Text(languageManager.text("failedLoad"))
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                    Text(error)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    Button(languageManager.text("retry")) {
                        viewModel.fetchInventory()
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 10)
                    .background(Color(red: 1, green: 0.66, blue: 0.66))
                    .cornerRadius(10)
                }
                .padding()
                Spacer()
                
            } else {
                // Inventory List — read-only for families
                List(viewModel.items) { item in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.category)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 4) {
                            Text("\(languageManager.text("quantity")): \(item.quantity)")
                                .font(.subheadline)
                            Text(localizedStatus(item.status))
                                .font(.caption)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 3)
                                .background(statusColor(item.status).opacity(0.2))
                                .foregroundColor(statusColor(item.status))
                                .cornerRadius(4)
                        }
                    }
                    .padding(.vertical, 4)
                }
                .refreshable {
                    viewModel.fetchInventory()
                }
                
                // Email Request Banner
                VStack(spacing: 10) {
                    Text(languageManager.text("requestItem"))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        sendEmailRequest()
                    }) {
                        HStack {
                            Image(systemName: "envelope.fill")
                            Text(languageManager.text("requestEmail"))
                                .font(.headline)
                            Spacer()
                            Image(systemName: "arrow.up.right.square")
                                .font(.subheadline)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0, green: 0.53, blue: 1))
                        .cornerRadius(12)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.08))
            }
        }
        .navigationTitle(languageManager.text("familyPage"))
        .onAppear {
            viewModel.fetchInventory()
        }
    }
    
    // Opens Mail app (or browser email client) with pre-filled fields
    func sendEmailRequest() {
        let subject = "Inventory Item Request – \(schoolName)"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let body = "Hello,\n\nI would like to request the following item(s):\n\n[Please list the items you need here]\n\nThank you."
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        // Try native Mail app first
        if let mailURL = URL(string: "mailto:\(schoolEmail)?subject=\(subject)&body=\(body)"),
           UIApplication.shared.canOpenURL(mailURL) {
            UIApplication.shared.open(mailURL)
        } else {
            // Fallback: open Gmail in Safari
            let gmailURL = URL(string: "https://mail.google.com/mail/?view=cm&to=\(schoolEmail)&su=\(subject)&body=\(body)")!
            UIApplication.shared.open(gmailURL)
        }
    }
    
    func localizedStatus(_ status: String) -> String {
        switch status {
        case "In Stock":     return languageManager.text("inStock")
        case "Low Stock":    return languageManager.text("lowStock")
        case "Out of Stock": return languageManager.text("outOfStock")
        default:             return status
        }
    }
    
    func statusColor(_ status: String) -> Color {
        switch status {
        case "In Stock":     return .green
        case "Low Stock":    return .orange
        case "Out of Stock": return .red
        default:             return .gray
        }
    }
}
 
// MARK: - Main Content View
 
struct ContentView: View {
    @StateObject var languageManager = LanguageManager()
    @State private var showLanguagePicker = false
    
    let languages = ["English", "Spanish", "Somali"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color.white
                    .ignoresSafeArea()
                
                // Logo
                Image("ENS Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 379, height: 313)
                    .offset(x: 0.50, y: -204.50)
                
                // Admin Login Button
                NavigationLink(destination: AdminView(languageManager: languageManager)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 296)
                            .fill(Color(red: 1, green: 0.66, blue: 0.66))
                            .frame(width: 186, height: 88)
                            .shadow(color: Color.black.opacity(0.12), radius: 40, y: 8)
                        
                        Text(languageManager.text("adminLogin"))
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
                    }
                }
                .offset(x: 0, y: 74)
                
                // Family Login Button
                NavigationLink(destination: FamilyView(languageManager: languageManager)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 296)
                            .fill(Color(red: 1, green: 0.66, blue: 0.66))
                            .frame(width: 186, height: 88)
                            .shadow(color: Color.black.opacity(0.12), radius: 40, y: 8)
                        
                        Text(languageManager.text("familyLogin"))
                            .font(Font.custom("SF Pro", size: 17).weight(.bold))
                            .foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
                    }
                }
                .offset(x: 0, y: 214)
                
                // Language Selector
                HStack(spacing: 4) {
                    Text(languageManager.text("language"))
                        .font(Font.custom("SF Pro", size: 16).weight(.bold))
                        .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                    Image(systemName: showLanguagePicker ? "chevron.down" : "chevron.up")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                }
                .onTapGesture {
                    withAnimation {
                        showLanguagePicker.toggle()
                    }
                }
                .offset(x: 107.50, y: 376)
                
                // Language Picker Popup
                if showLanguagePicker {
                    VStack(spacing: 0) {
                        ForEach(languages, id: \.self) { language in
                            Button(action: {
                                withAnimation {
                                    languageManager.currentLanguage = language
                                    showLanguagePicker = false
                                }
                            }) {
                                HStack {
                                    Text(language)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(
                                            languageManager.currentLanguage == language
                                            ? Color(red: 0, green: 0.53, blue: 1)
                                            : Color(red: 0.10, green: 0.10, blue: 0.10)
                                        )
                                    Spacer()
                                    if languageManager.currentLanguage == language {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                            }
                            if language != languages.last {
                                Divider()
                            }
                        }
                    }
                    .frame(width: 180)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, y: 4)
                    .offset(x: 90, y: 280)
                }
            }
            .frame(width: 402, height: 874)
        }
    }
}
 
// MARK: - Preview
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
