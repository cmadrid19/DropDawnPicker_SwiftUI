//
//  DropDawnPicker.swift
//  DropDawnPicker
//
//  Created by Maxim Macari on 28/3/21.
//

import SwiftUI

struct DropDawnPicker: View {
    
    var title: String
    @Binding var selection: String
    var options: [String]
    
    @State private var showOptions: Bool = false
    
    var body: some View {
        ZStack{
            HStack{
                Text("\(title)")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("\(selection)")
                    .foregroundColor(Color.gray)
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
            }
            .font(.caption)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.white)
            .onTapGesture {
                withAnimation(Animation.spring().speed(2)){
                    showOptions = true
                }
            }
            
            if showOptions {
                VStack(alignment: .leading, spacing: 4){
                    Text("\(title)")
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 5){
                            Spacer()
                            ForEach(options, id: \.self) { (option) in
                                Button(action: {
                                    withAnimation(Animation.spring().speed(2)){
                                        showOptions.toggle()
                                        if selection != option {
                                            selection = option
                                        }
                                    }
                                }, label: {
                                    if selection == option {
                                        Text("\(option)")
                                            .font(.caption)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 12)
                                            .background(Color.white.opacity(0.2))
                                            .cornerRadius(4)
                                            .lineLimit(1)
                                    } else {
                                        Text("\(option)")
                                            .font(.caption)
                                            .lineLimit(1)
                                    }
                                })
                                
                                Spacer()
                                
                            }
                        }
                    }
                    .padding(.vertical, 2)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.black)
                .foregroundColor(Color.white)
                .transition(.opacity)
            }
        }
    }
}

struct DropDawnPicker_Previews: PreviewProvider {
    static var previews: some View {
        DropDawnPicker(title: "Candies",
                       selection: .constant("Caramels"),
                       options: ["Marshmallows","Caramels","Chocolates", "Cotton", "Gumdrops"])
    }
}


