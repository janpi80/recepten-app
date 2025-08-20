cat <<EOF > README.md
# 📱 Recepten-app (iOS & iPadOS)

Een iOS-app gebouwd met SwiftUI die recepten ophaalt uit een **Supabase-database**.  
De app toont de recepten en instructies in een overzichtelijke interface, en houdt het scherm actief tijdens het koken.

---

## 🚀 Features
- Recepten laden vanuit Supabase  
- Gedetailleerde kookinstructies  
- Scherm blijft aan tijdens koken (handig bij het volgen van stappen)  
- Ondersteuning voor zowel iPhone als iPad  

---

## ⚙️ Installatie

1. **Clone de repo**
   \`\`\`bash
   git clone https://github.com/janpi80/recepten-app.git
   cd recepten-app
   \`\`\`

2. **Open in Xcode**
   - Open \`Recepten-app.xcodeproj\` of \`Recepten-app.xcworkspace\`

3. **Voeg je eigen Info.plist toe**
   Omdat de app verbinding maakt met jouw Supabase-project, moet je lokaal een \`Info.plist\` bestand hebben met de juiste variabelen.  
   Dit bestand staat in \`.gitignore\` en wordt dus **niet meegeleverd**.

   Maak (of bewerk) \`Recepten-app/Info.plist\` en voeg daar de volgende keys toe:

   \`\`\`xml
   <key>SUPABASE_URL</key>
   <string>https://your-project.supabase.co</string>
   <key>SUPABASE_ANON_KEY</key>
   <string>your-anon-key</string>
   \`\`\`

4. **Run de app**
   Klik in Xcode op ▶️ **Run** om de app te starten in de simulator of op een device.

---

## 🔒 Beveiliging
- Gevoelige bestanden zoals \`Info.plist\` en \`Secrets.xcconfig\` staan in \`.gitignore\` en worden **niet geüpload naar GitHub**.  

---

✍️ Gemaakt door **janpi80**
EOF
