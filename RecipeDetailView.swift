import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    // Helper: tekst opdelen in secties
    private var sections: [(title: String, content: String)] {
        let parts = recipe.omschrijving.components(separatedBy: "## ")
        return parts.compactMap { part in
            let lines = part.split(separator: "\n", maxSplits: 1).map(String.init)
            guard lines.count > 1 else { return nil }
            return (title: lines[0], content: lines[1])
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(recipe.naam_kort)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                
                ForEach(sections, id: \.title) { section in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(section.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text(section.content)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(recipe.naam_kort)
        .navigationBarTitleDisplayMode(.inline)
    }
}
