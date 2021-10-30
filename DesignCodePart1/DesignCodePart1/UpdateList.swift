//
//  UpdateList.swift
//  DesignCodePart1
//
//  Created by Jinho Choi on 2021/10/30.
//

import SwiftUI

struct UpdateList: View {
    
    var body: some View {
        NavigationView {
            List(updateData) { update in
                NavigationLink(
                    destination: Text(update.text)) {
                    HStack {
                        Image(update.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.trailing, 4)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(update.title)
                                .font(.system(size: 20, weight: .bold))
                            
                            Text(update.text)
                                .lineLimit(2)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text(update.date)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.vertical, 7)
            }
            .navigationTitle(Text("Updates"))
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI", text: "SwiftUI`s Text", date: "Oct 30"),
    Update(image: "Card2", title: "Combine", text: "Combine`s Text", date: "Oct 30"),
    Update(image: "Card3", title: "TDD", text: "TDD`s Text", date: "Oct 30"),
    Update(image: "Card4", title: "Review", text: "Review`s Text", date: "Oct 30")
]
