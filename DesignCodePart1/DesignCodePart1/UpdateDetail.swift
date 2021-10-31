//
//  UpdateDetail.swift
//  DesignCodePart1
//
//  Created by Jinho Choi on 2021/10/31.
//

import SwiftUI

struct UpdateDetail: View {
    
    var update: Update = updateData[0]
    
    var body: some View {
        List { 
            VStack {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .navigationBarTitle(update.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        UpdateDetail()
    }
}
