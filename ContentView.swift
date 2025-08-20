import SwiftUI

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []

    init() {
        Task {
            await fetchRecipes()
        }
    }

    func fetchRecipes() async {
        do {
            let response: [Recipe] = try await SupabaseManager.shared.client
                .from("Voorraad")
                .select()
                .eq("categorie", value: "recepten")
                .execute()
                .value

            print("✅ Supabase response: \(response)")

            self.recipes = response
        } catch {
            print("❌ Fout bij ophalen recepten: \(error)")
        }
    }
}

struct ContentView: View {
    @ObservedObject var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    Text(recipe.naam_kort) // let op: veld uit je Supabase-tabel
                        .font(.headline)
                        .padding(.vertical, 8)
                }
            }
            .navigationTitle("Recepten")
        }
    }
}

#Preview {
    ContentView()
}
