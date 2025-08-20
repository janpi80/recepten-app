import Foundation
import Supabase

class SupabaseManager {
    static let shared = SupabaseManager()

    let client: SupabaseClient

    private init() {
        guard let supabaseURLString = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL") as? String,
              let supabaseKey = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_ANON_KEY") as? String else {
            fatalError("❌ SUPABASE_URL of SUPABASE_ANON_KEY ontbreekt in Info.plist")
        }

        print("📡 Supabase raw URL string:", supabaseURLString)
        print("🔑 Supabase anon key gevonden:", supabaseKey.prefix(8), "...") // alleen eerste tekens tonen

        guard let supabaseURL = URL(string: supabaseURLString) else {
            fatalError("❌ Ongeldige Supabase URL: \(supabaseURLString)")
        }

        // Safe unwrap van host
        let hostPart = supabaseURL.host?.split(separator: ".").first ?? "default"
        print("🗄️ Supabase hostPart:", hostPart)

        client = SupabaseClient(
            supabaseURL: supabaseURL,
            supabaseKey: supabaseKey
        )
    }
}
