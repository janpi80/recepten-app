import Foundation

struct Recipe: Identifiable, Codable {
    let id: Int
    let categorie: String
    let naam_kort: String
    let omschrijving: String
    let hoeveelheid: Int
    let eenheid: String

    var title: String { naam_kort }

    // Ingrediënten en instructies opsplitsen
    var ingredients: [String] {
        omschrijving
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty && !$0.lowercased().contains("bereiding:") }
    }

    var instructions: [String] {
        omschrijving
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty && $0.lowercased().contains("bereiding:") == false }
    }
}
