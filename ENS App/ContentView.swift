import SwiftUI

// MARK: - Approved Admin Emails
// ⚠️ ADD MORE EMAILS HERE AS NEEDED

let approvedAdminEmails: [String] = [
    "64005899@ep-student.org"
]

// MARK: - Schools List

struct School: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let email: String
    let sheetTab: String
}

let allSchools: [School] = [
    School(name: "Eden Prairie High School",     email: "EPHS@edenpr.org",         sheetTab: "EPHS"),
    School(name: "Central Middle School",        email: "CMS@edenpr.org",          sheetTab: "CMS"),
    School(name: "Cedar Ridge Elementary",       email: "CedarRidge@edenpr.org",   sheetTab: "Cedar Ridge"),
    School(name: "Eagle Heights and Oak Point",    email: "EagleHeights@edenpr.org", sheetTab: "Eagle Heights and Oak Point"),
    School(name: "Eden Lake Elementary",         email: "EdenLake@edenpr.org",     sheetTab: "Eden Lake"),
    School(name: "Forest Hills Elementary",      email: "ForestHills@edenpr.org",  sheetTab: "Forest Hills"),
    School(name: "Prairie View and Little Eagles", email: "PrairieView@edenpr.org",  sheetTab: "Prairie View and Little Eagles"),
    School(name: "EP Online and TASSEL",           email: "eponline@edenpr.org",     sheetTab: "EP Online and TASSEL")
]

// MARK: - Category Order

let categoryOrder = [
    "School Supplies",
    "Personal Care Items",
    "Household Items",
    "Food",
    "Clothing"
]

// MARK: - Language Manager

class LanguageManager: ObservableObject {
    @Published var currentLanguage: String = "English"

    let translations: [String: [String: String]] = [
        "English": [
            "adminLogin":      "Admin Login",
            "familyLogin":     "Family Login",
            "language":        "Language",
            "adminPage":       "Admin Panel",
            "familyPage":      "Inventory",
            "loading":         "Loading inventory...",
            "failedLoad":      "Failed to load inventory",
            "requestItem":     "Tap items to select, then request:",
            "requestEmail":    "Request Selected Items",
            "requestCount":    "Request",
            "itemsSelected":   "items selected",
            "openSheet":       "Open Inventory Sheet",
            "editSheet":       "Edit the spreadsheet directly to update inventory",
            "itemName":        "Item",
            "category":        "Category",
            "quantity":        "Qty",
            "inStock":         "In Stock",
            "lowStock":        "Low Stock",
            "outOfStock":      "Out of Stock",
            "pullRefresh":     "Pull to refresh",
            "adminPanel":      "Admin Panel",
            "retry":           "Retry",
            "selectSchool":    "Select your school",
            "sendingTo":       "Sending to",
            "clearAll":        "Clear All",
            "enterEmail":      "Enter your email address to continue",
            "continueBtn":     "Continue",
            "accessDenied":    "Access Denied",
            "accessDeniedMsg": "This email is not authorized to access the admin panel. Please contact your administrator.",
            
            // Categories
            "School Supplies":     "School Supplies",
            "Personal Care Items": "Personal Care Items",
            "Household Items":     "Household Items",
            "Food":                "Food",
            "Clothing":            "Clothing",
            // Items
            "Notebooks": "Notebooks", "Backpacks": "Backpacks", "Folders": "Folders",
            "Pencil Pouch": "Pencil Pouch", "Colored Pencils": "Colored Pencils",
            "Markers": "Markers", "Notecards": "Notecards",
            "Graphing Calculator": "Graphing Calculator",
            "Writing Utensils": "Writing Utensils", "Erasers": "Erasers",
            "Soap": "Soap", "Brush/Comb": "Brush/Comb",
            "Shampoo for all hair types": "Shampoo for all hair types",
            "Body Spray": "Body Spray", "Deodorant": "Deodorant",
            "Feminine Care Products": "Feminine Care Products",
            "Hair Ties": "Hair Ties", "Hair Pins": "Hair Pins", "Floss": "Floss",
            "Laundry Detergent": "Laundry Detergent", "Garbage Bags": "Garbage Bags",
            "Sandwich Bags": "Sandwich Bags", "Water Bottles": "Water Bottles",
            "Sanitizing Wipes": "Sanitizing Wipes", "Hand Sanitizer": "Hand Sanitizer",
            "Towels": "Towels", "Paper Products": "Paper Products", "Dish Soap": "Dish Soap",
            "Granola Bars": "Granola Bars", "Mac n' Cheese Cups": "Mac n' Cheese Cups",
            "Juice Boxes": "Juice Boxes", "Ramen Noodles": "Ramen Noodles",
            "Fruit Cups": "Fruit Cups", "Snack Items": "Snack Items",
            "Non-Perishable Food Items": "Non-Perishable Food Items",
            "Take Home Meals/ Ingredients": "Take Home Meals/ Ingredients",
            "Winter Clothing": "Winter Clothing", "Jackets": "Jackets", "Boots": "Boots",
            "Hats": "Hats", "Gloves": "Gloves", "Scarves": "Scarves",
            "Eden Prairie Apparel": "Eden Prairie Apparel",
            "Undergarments (NEW and IN PACKING!)": "Undergarments (NEW and IN PACKING!)",
            "Socks (NEW and IN PACKING!)": "Socks (NEW and IN PACKING!)"
        ],
        "Spanish": [
            "adminLogin":      "Inicio Admin",
            "familyLogin":     "Inicio Familia",
            "language":        "Idioma",
            "adminPage":       "Panel Admin",
            "familyPage":      "Inventario",
            "loading":         "Cargando inventario...",
            "failedLoad":      "Error al cargar inventario",
            "requestItem":     "Toque artículos para seleccionar, luego solicite:",
            "requestEmail":    "Solicitar artículos seleccionados",
            "requestCount":    "Solicitar",
            "itemsSelected":   "artículos seleccionados",
            "openSheet":       "Abrir Hoja de Inventario",
            "editSheet":       "Edite la hoja de cálculo directamente para actualizar el inventario",
            "itemName":        "Artículo",
            "category":        "Categoría",
            "quantity":        "Cant",
            "inStock":         "En Stock",
            "lowStock":        "Stock Bajo",
            "outOfStock":      "Agotado",
            "pullRefresh":     "Jalar para actualizar",
            "adminPanel":      "Panel de Admin",
            "retry":           "Reintentar",
            "selectSchool":    "Seleccione su escuela",
            "sendingTo":       "Enviando a",
            "clearAll":        "Borrar Todo",
            "enterEmail":      "Ingrese su dirección de correo para continuar",
            "continueBtn":     "Continuar",
            "accessDenied":    "Acceso Denegado",
            "accessDeniedMsg": "Este correo no está autorizado. Contacte a su administrador.",
            // Categories
            "School Supplies":     "Útiles Escolares",
            "Personal Care Items": "Artículos de Cuidado Personal",
            "Household Items":     "Artículos del Hogar",
            "Food":                "Comida",
            "Clothing":            "Ropa",
            // Items
            "Notebooks": "Cuadernos", "Backpacks": "Mochilas", "Folders": "Carpetas",
            "Pencil Pouch": "Estuche para lápices", "Colored Pencils": "Lápices de colores",
            "Markers": "Marcadores", "Notecards": "Tarjetas de notas",
            "Graphing Calculator": "Calculadora gráfica",
            "Writing Utensils": "Útiles de escritura", "Erasers": "Borradores",
            "Soap": "Jabón", "Brush/Comb": "Cepillo/Peine",
            "Shampoo for all hair types": "Champú para todo tipo de cabello",
            "Body Spray": "Spray corporal", "Deodorant": "Desodorante",
            "Feminine Care Products": "Productos de cuidado femenino",
            "Hair Ties": "Ligas para el cabello", "Hair Pins": "Pasadores",
            "Floss": "Hilo dental", "Laundry Detergent": "Detergente para ropa",
            "Garbage Bags": "Bolsas de basura", "Sandwich Bags": "Bolsas para sándwich",
            "Water Bottles": "Botellas de agua", "Sanitizing Wipes": "Toallitas desinfectantes",
            "Hand Sanitizer": "Desinfectante de manos", "Towels": "Toallas",
            "Paper Products": "Productos de papel", "Dish Soap": "Jabón para platos",
            "Granola Bars": "Barras de granola",
            "Mac n' Cheese Cups": "Tazas de macarrones con queso",
            "Juice Boxes": "Cajitas de jugo", "Ramen Noodles": "Fideos ramen",
            "Fruit Cups": "Tazas de fruta", "Snack Items": "Artículos de merienda",
            "Non-Perishable Food Items": "Alimentos no perecederos",
            "Take Home Meals/ Ingredients": "Comidas/Ingredientes para llevar",
            "Winter Clothing": "Ropa de invierno", "Jackets": "Chaquetas", "Boots": "Botas",
            "Hats": "Sombreros", "Gloves": "Guantes", "Scarves": "Bufandas",
            "Eden Prairie Apparel": "Ropa de Eden Prairie",
            "Undergarments (NEW and IN PACKING!)": "Ropa interior (¡NUEVA y EN EMPAQUE!)",
            "Socks (NEW and IN PACKING!)": "Calcetines (¡NUEVOS y EN EMPAQUE!)"
        ],
        "Somali": [
            "adminLogin":      "Galitaanka Admin",
            "familyLogin":     "Galitaanka Qoyska",
            "language":        "Luqadda",
            "adminPage":       "Xafiiska Admin",
            "familyPage":      "Kaydka",
            "loading":         "Rarida kaydka...",
            "failedLoad":      "Waxaa ku guuldareystay rarida kaydka",
            "requestItem":     "Taabo shayga si aad u doorato, ka dib codso:",
            "requestEmail":    "Codsashada Shayada La Doortay",
            "requestCount":    "Codso",
            "itemsSelected":   "shay la doortay",
            "openSheet":       "Fur Xaashida Kaydka",
            "editSheet":       "Tifaftir xaashida si toos ah si loo cusboonaysiiyo kaydka",
            "itemName":        "Shay",
            "category":        "Qaybta",
            "quantity":        "Tiro",
            "inStock":         "Kaydka Ku Jira",
            "lowStock":        "Kayd Yar",
            "outOfStock":      "Ka Maqan",
            "pullRefresh":     "Jiid si aad u cusboonaysiisonoysato",
            "adminPanel":      "Xafiiska Admin",
            "retry":           "Isku day mar kale",
            "selectSchool":    "Dugsigaaga Dooro",
            "sendingTo":       "Loo dirayo",
            "clearAll":        "Nadiifi Dhammaan",
            "enterEmail":      "Geli ciwaanka emailkaaga si aad u sii waddo",
            "continueBtn":     "Sii wad",
            "accessDenied":    "Galitaanka Diidmay",
            "accessDeniedMsg": "Emailkan lama ogola. La xiriir maamulkaaga.",
            // Categories
            "School Supplies":     "Agabka Dugsiga",
            "Personal Care Items": "Alaabta Daryeelka Shakhsiga",
            "Household Items":     "Alaabta Guriga",
            "Food":                "Cunto",
            "Clothing":            "Dharka",
            // Items
            "Notebooks": "Buugaagta Qoraalka", "Backpacks": "Bac-dhabarka",
            "Folders": "Fayl-jilayaasha", "Pencil Pouch": "Kiisku Qalin",
            "Colored Pencils": "Qalinno Midabka leh", "Markers": "Markers",
            "Notecards": "Kaararka Xusuusnta",
            "Graphing Calculator": "Kaalkuleytor Sawir-gacmeedka",
            "Writing Utensils": "Qalab Qorista", "Erasers": "Tirtirayaasha",
            "Soap": "Saabuun", "Brush/Comb": "Burush/Misho",
            "Shampoo for all hair types": "Shampoo dhammaan noocyada timaha",
            "Body Spray": "Cafiis Jirka", "Deodorant": "Diodrant",
            "Feminine Care Products": "Alaabta Daryeelka Dumarku",
            "Hair Ties": "Xidhayaasha Timaha", "Hair Pins": "Ibirrada Timaha",
            "Floss": "Xadhkaha Ilkaha", "Laundry Detergent": "Sabuurada Dharka",
            "Garbage Bags": "Kiisaska Qashinka", "Sandwich Bags": "Kiisaska Sandwiishka",
            "Water Bottles": "Dhalooyinka Biyaha", "Sanitizing Wipes": "Tirtiraha Nadiifinta",
            "Hand Sanitizer": "Nadiifiyaha Gacmaha", "Towels": "Tuwaalayaasha",
            "Paper Products": "Alaabta Warqadda", "Dish Soap": "Saabuunta Saxanta",
            "Granola Bars": "Bararka Granola",
            "Mac n' Cheese Cups": "Koobabka Baasta iyo Jiiska",
            "Juice Boxes": "Sanduuqyada Casiirta", "Ramen Noodles": "Noodles-ka Ramen",
            "Fruit Cups": "Koobabka Miraha", "Snack Items": "Cuntada Yaryar",
            "Non-Perishable Food Items": "Cuntada aan Xumaan",
            "Take Home Meals/ Ingredients": "Cuntada/Sheyga Guriga Loo Qaado",
            "Winter Clothing": "Dharka Jiilaalka", "Jackets": "Jaakadaha",
            "Boots": "Buudhadaha", "Hats": "Koofiyadaha", "Gloves": "Gacmo-gashiga",
            "Scarves": "Shaashada Qoorta", "Eden Prairie Apparel": "Dharka Eden Prairie",
            "Undergarments (NEW and IN PACKING!)": "Dharka Hoose (CUSUB oo XIDHAN!)",
            "Socks (NEW and IN PACKING!)": "Sharaabadaha (CUSUB oo XIDHAN!)"
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

    let apiKey = ENSSecrets.apiKey()
    let spreadsheetID = ENSSecrets.spreadsheetId()

    func fetchInventory(for school: School) {
        isLoading = true
        errorMessage = nil
        items = []

        let tabName = school.sheetTab
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? school.sheetTab
        let range = "\(tabName)!A2:D100"
        let urlString = "https://sheets.googleapis.com/v4/spreadsheets/\(spreadsheetID)/values/\(range)?key=\(apiKey)"

        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"; isLoading = false; return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error { self.errorMessage = error.localizedDescription; return }
                if let data = data, let raw = String(data: data, encoding: .utf8) {
                    print("🔍 RAW RESPONSE (\(school.sheetTab)): \(raw)")
                }
                if let httpResponse = response as? HTTPURLResponse {
                    print("📡 HTTP STATUS: \(httpResponse.statusCode)")
                }
                guard let data = data,
                      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    self.errorMessage = "Failed to load inventory"; return
                }
                let rows = json["values"] as? [[String]] ?? []
                self.items = rows.compactMap { row in
                    guard row.count >= 4 else { return nil }
                    return InventoryItem(name: row[0], category: row[1],
                                        quantity: Int(row[2]) ?? 0, status: row[3])
                }
            }
        }.resume()
    }
}

// MARK: - Admin Login View

struct AdminLoginView: View {
    @ObservedObject var languageManager: LanguageManager

    @State private var enteredEmail = ""
    @State private var showAccessDenied = false
    @State private var navigateToAdmin = false

    var isEmailApproved: Bool {
        let normalized = enteredEmail
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
        return approvedAdminEmails
            .map { $0.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) }
            .contains(normalized)
    }

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: 16) {
                Image(systemName: "lock.shield.fill")
                    .font(.system(size: 64))
                    .foregroundColor(Color(red: 1, green: 0.66, blue: 0.66))

                Text("Admin Access")
                    .font(.largeTitle.bold())

                Text(languageManager.text("enterEmail"))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }

            Spacer()

            VStack(spacing: 16) {

                // Access Denied message
                if showAccessDenied {
                    VStack(spacing: 10) {
                        Image(systemName: "xmark.shield.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.red)
                        Text(languageManager.text("accessDenied"))
                            .font(.headline).foregroundColor(.red)
                        Text(languageManager.text("accessDeniedMsg"))
                            .font(.caption).foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red.opacity(0.06))
                    .cornerRadius(12)
                    .padding(.horizontal, 28)
                }

                // Email field
                VStack(alignment: .leading, spacing: 6) {
                    Text(languageManager.text(""))
                        .font(.caption.bold())
                        .foregroundColor(.gray)
                        .padding(.leading, 4)

                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        TextField("Email Address", text: $enteredEmail)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .onChange(of: enteredEmail) { oldValue, newValue in
                                if showAccessDenied { showAccessDenied = false }
                            }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.08))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                showAccessDenied ? Color.red.opacity(0.4) : Color.gray.opacity(0.2),
                                lineWidth: 1
                            )
                    )
                }
                .padding(.horizontal, 28)

                // Navigation to admin panel when approved
                NavigationLink(
                    destination: AdminView(languageManager: languageManager),
                    isActive: $navigateToAdmin
                ) {
                    EmptyView()
                }
                .hidden()

                // Continue button
                Button(action: { checkAccess() }) {
                    HStack {
                        Image(systemName: "arrow.right.circle.fill")
                        Text(languageManager.text("continueBtn"))
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        enteredEmail.isEmpty
                        ? Color.gray.opacity(0.4)
                        : Color(red: 0, green: 0.53, blue: 1)
                    )
                    .cornerRadius(12)
                }
                .disabled(enteredEmail.isEmpty)
                .padding(.horizontal, 28)
            }

            Spacer().frame(height: 48)
        }
        .navigationTitle(languageManager.text("adminLogin"))
        .navigationBarTitleDisplayMode(.inline)
    }

    func checkAccess() {
        if isEmailApproved {
            showAccessDenied = false
            navigateToAdmin = true
        } else {
            withAnimation { showAccessDenied = true }
        }
    }
}

// MARK: - Admin View

struct AdminView: View {
    @ObservedObject var languageManager: LanguageManager
    let spreadsheetID = ENSSecrets.spreadsheetId()

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
                Button(action: {
                    if let url = URL(string: "https://docs.google.com/spreadsheets/d/\(spreadsheetID)/edit") {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }) {
                    HStack {
                        Image(systemName: "tablecells.fill")
                        Text(languageManager.text("openSheet")).font(.headline)
                        Spacer()
                        Image(systemName: "arrow.up.right.square").font(.subheadline)
                    }
                    .foregroundColor(.white).frame(maxWidth: .infinity).padding()
                    .background(Color(red: 0, green: 0.53, blue: 1)).cornerRadius(12)
                }

                Text(languageManager.text("editSheet"))
                    .font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.center)
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

    @State private var selectedSchool: School = allSchools[0]
    @State private var showSchoolPicker = false
    @State private var selectedItemIDs: Set<UUID> = []

    var selectedItems: [InventoryItem] {
        viewModel.items.filter { selectedItemIDs.contains($0.id) }
    }

    var body: some View {
        VStack(spacing: 0) {

            // ── School Selector Banner ──────────────────────────────
            Button(action: { withAnimation { showSchoolPicker.toggle() } }) {
                HStack(spacing: 8) {
                    Image(systemName: "building.columns.fill")
                        .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                    Text(selectedSchool.name)
                        .font(.subheadline.bold())
                        .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                        .lineLimit(1)
                    Spacer()
                    Image(systemName: showSchoolPicker ? "chevron.up" : "chevron.down")
                        .font(.caption.bold())
                        .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                }
                .padding(.horizontal, 16).padding(.vertical, 10)
                .background(Color(red: 0, green: 0.53, blue: 1).opacity(0.08))
            }

            // ── School Dropdown ─────────────────────────────────────
            if showSchoolPicker {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(allSchools) { school in
                            Button(action: {
                                withAnimation {
                                    selectedSchool = school
                                    showSchoolPicker = false
                                    selectedItemIDs.removeAll()
                                    viewModel.fetchInventory(for: school)
                                }
                            }) {
                                HStack {
                                    Text(school.name).font(.subheadline)
                                        .foregroundColor(selectedSchool.id == school.id
                                            ? Color(red: 0, green: 0.53, blue: 1) : .primary)
                                    Spacer()
                                    if selectedSchool.id == school.id {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                                            .font(.caption.bold())
                                    }
                                }
                                .padding(.horizontal, 16).padding(.vertical, 12)
                                .background(selectedSchool.id == school.id
                                    ? Color(red: 0, green: 0.53, blue: 1).opacity(0.06) : Color.white)
                            }
                            Divider().padding(.leading, 16)
                        }
                    }
                }
                .frame(maxHeight: 280).background(Color.white)
                .shadow(color: Color.black.opacity(0.08), radius: 8, y: 4)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }

            // ── Inventory Content ───────────────────────────────────
            if viewModel.isLoading {
                Spacer()
                ProgressView(languageManager.text("loading")).padding()
                Spacer()

            } else if let error = viewModel.errorMessage {
                Spacer()
                VStack(spacing: 12) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 40)).foregroundColor(.orange)
                    Text(languageManager.text("failedLoad"))
                        .foregroundColor(.red).multilineTextAlignment(.center)
                    Text(error).font(.caption).foregroundColor(.gray).multilineTextAlignment(.center)
                    Button(languageManager.text("retry")) {
                        viewModel.fetchInventory(for: selectedSchool)
                    }
                    .padding(.horizontal, 24).padding(.vertical, 10)
                    .background(Color(red: 1, green: 0.66, blue: 0.66)).cornerRadius(10)
                }
                .padding()
                Spacer()

            } else {
                let grouped = Dictionary(grouping: viewModel.items, by: { $0.category })
                let sortedCategories = categoryOrder.filter { grouped[$0] != nil }

                List {
                    ForEach(sortedCategories, id: \.self) { category in
                        Section(header:
                            Text(languageManager.text(category))
                                .font(.headline).foregroundColor(.primary).textCase(nil)
                        ) {
                            ForEach(grouped[category] ?? []) { item in
                                let isSelected = selectedItemIDs.contains(item.id)
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.15)) {
                                        if isSelected { selectedItemIDs.remove(item.id) }
                                        else { selectedItemIDs.insert(item.id) }
                                    }
                                }) {
                                    HStack(spacing: 12) {
                                        Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                                            .font(.system(size: 22))
                                            .foregroundColor(isSelected
                                                ? Color(red: 0, green: 0.53, blue: 1)
                                                : Color.gray.opacity(0.4))

                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(languageManager.text(item.name))
                                                .font(.headline)
                                                .foregroundColor(isSelected
                                                    ? Color(red: 0, green: 0.53, blue: 1) : .primary)
                                            Text(languageManager.text(item.category))
                                                .font(.subheadline).foregroundColor(.gray)
                                        }

                                        Spacer()

                                        VStack(alignment: .trailing, spacing: 4) {
                                            Text("\(languageManager.text("quantity")): \(item.quantity)")
                                                .font(.subheadline)
                                            Text(localizedStatus(item.status))
                                                .font(.caption)
                                                .padding(.horizontal, 6).padding(.vertical, 3)
                                                .background(statusColor(item.status).opacity(0.2))
                                                .foregroundColor(statusColor(item.status))
                                                .cornerRadius(4)
                                        }
                                    }
                                    .padding(.vertical, 6).padding(.horizontal, 4)
                                    .background(isSelected
                                        ? Color(red: 0, green: 0.53, blue: 1).opacity(0.07) : Color.clear)
                                    .cornerRadius(10)
                                }
                                .buttonStyle(.plain)
                                .listRowBackground(isSelected
                                    ? Color(red: 0, green: 0.53, blue: 1).opacity(0.07) : Color.clear)
                            }
                        }
                    }
                }
                .refreshable {
                    selectedItemIDs.removeAll()
                    viewModel.fetchInventory(for: selectedSchool)
                }

                // ── Request Banner ──────────────────────────────────
                VStack(spacing: 8) {
                    if selectedItemIDs.isEmpty {
                        Text(languageManager.text("requestItem"))
                            .font(.subheadline).foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    } else {
                        HStack {
                            Text("\(selectedItemIDs.count) \(languageManager.text("itemsSelected"))")
                                .font(.subheadline.bold())
                                .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                            Spacer()
                            Button(languageManager.text("clearAll")) {
                                withAnimation { selectedItemIDs.removeAll() }
                            }
                            .font(.caption.bold()).foregroundColor(.red)
                        }
                    }

                    Text("\(languageManager.text("sendingTo")): \(selectedSchool.name)")
                        .font(.caption)
                        .foregroundColor(Color(red: 0, green: 0.53, blue: 1))

                    Button(action: { sendEmailRequest() }) {
                        HStack {
                            Image(systemName: "envelope.fill")
                            Text(selectedItemIDs.isEmpty
                                ? languageManager.text("requestEmail")
                                : "\(languageManager.text("requestCount")) \(selectedItemIDs.count) \(languageManager.text("itemsSelected"))")
                                .font(.headline)
                            Spacer()
                            Image(systemName: "arrow.up.right.square").font(.subheadline)
                        }
                        .foregroundColor(.white).frame(maxWidth: .infinity).padding()
                        .background(Color(red: 0, green: 0.53, blue: 1)).cornerRadius(12)
                    }
                }
                .frame(maxWidth: .infinity).padding().background(Color.gray.opacity(0.08))
            }
        }
        .navigationTitle(languageManager.text("familyPage"))
        .onAppear { viewModel.fetchInventory(for: selectedSchool) }
    }

    func sendEmailRequest() {
        let itemLines: String
        if selectedItems.isEmpty {
            itemLines = "[Please list the items you need here]"
        } else {
            itemLines = selectedItems.map { "- \($0.name)" }.joined(separator: "\n")
        }

        let subject = "Inventory Item Request – \(selectedSchool.name)"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let body = "Hello,\n\nI would like to request the following item(s):\n\n\(itemLines)\n\nThank you."
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        if let mailURL = URL(string: "mailto:\(selectedSchool.email)?subject=\(subject)&body=\(body)"),
           UIApplication.shared.canOpenURL(mailURL) {
            UIApplication.shared.open(mailURL)
        } else {
            let gmailURL = URL(string: "https://mail.google.com/mail/?view=cm&to=\(selectedSchool.email)&su=\(subject)&body=\(body)")!
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
                Color.white.ignoresSafeArea()

                Image("ENS Image")
                    .resizable().scaledToFit()
                    .frame(width: 379, height: 313)
                    .offset(x: 0.50, y: -204.50)

                // Admin Login → email gate
                NavigationLink(destination: AdminLoginView(languageManager: languageManager)) {
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

                // Family Login → inventory with school picker + item selection
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
                .onTapGesture { withAnimation { showLanguagePicker.toggle() } }
                .offset(x: 107.50, y: 376)

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
                                    Text(language).font(.system(size: 16, weight: .medium))
                                        .foregroundColor(languageManager.currentLanguage == language
                                            ? Color(red: 0, green: 0.53, blue: 1)
                                            : Color(red: 0.10, green: 0.10, blue: 0.10))
                                    Spacer()
                                    if languageManager.currentLanguage == language {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(Color(red: 0, green: 0.53, blue: 1))
                                    }
                                }
                                .padding(.horizontal, 16).padding(.vertical, 12)
                            }
                            if language != languages.last { Divider() }
                        }
                    }
                    .frame(width: 180).background(Color.white).cornerRadius(12)
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
