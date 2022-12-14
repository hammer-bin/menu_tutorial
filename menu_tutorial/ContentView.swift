//
//  ContentView.swift
//  menu_tutorial
//
//  Created by minkyuLee on 2022/07/29.
//

import SwiftUI

let MyPets = ["λ©λ©μ΄ πΆ", "μΌμΉμ΄ π±", "μ°μ°μ΄ π­", "ν λΌ π°"]

struct ContentView: View {
    
    @State private var shouldShowAlert : Bool = false
    @State private var myText : String = ""
    @State private var selected : Int = 0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                Spacer()
                Text("\(MyPets[selected])")
                        .font(.system(size: 60))
                        .bold()
                    Text("μ°μΈ‘ μλ¨μ λ‘λ‘λ‘μ λλ¬μ£ΌμΈμ!")
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()
                }
            
                .padding()
                .navigationTitle("νμ΄μ")
                .toolbar(content: {
                    ToolbarItem(placement: .primaryAction,
                        content: {
                        Menu{
                            Button(action: {
                                print("λ²νΌν΄λ¦­")
                                shouldShowAlert = true
                                myText = "μ€λλ κ°λ°©νν΄λΌμ°λμΌν°"
                            }, label: {
                                Label("μ€λλ λΉ‘μ½λ©!", systemImage: "flame.fill")
                            })
                            
                            Section{
                                Button {
                                    print("λ²νΌν΄λ¦­")
                                    shouldShowAlert = true
                                    myText = "μ€λμ μ¬λλ "
                                } label: {
                                    Label("μ§μμ μ¬λλ !", systemImage: "flame.fill")
                                }
                            }
                            
                            Section {
                                Button {
                                    
                                }label : {
                                    Label("μνμΌ λ§λ€κΈ°", systemImage: "doc")
                                }
                                Button {
                                    
                                }label : {
                                    Label("μν΄λ λ§λ€κΈ°", systemImage: "folder")
                                }
                            }
                            
                            Section {
                                Button {
                                    
                                }label : {
                                    Label("νμΌ λͺ¨λ μ­μ ", systemImage: "trash")
                                }
                              
                            }
                            
                            Picker(selection: $selected, label: Text("μ μλλ¬Ό μ ν")){
                                ForEach(MyPets.indices, id: \.self, content: { index in
                                    Text("\(MyPets[index])").tag(index)
                                })
                            }

                        } label: {
                            Circle().foregroundColor(Color.cyan)
                                .frame(width: 50, height: 50, alignment: .center)
                                .overlay(
                                    Label("λλ³΄κΈ°", systemImage: "ellipsis")
                                        .font(.system(size: 30))
                                        .foregroundColor(Color.yellow)
                                )
                            
                        } // λ©λ΄
                    })
                }) // toolbar
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("μλ¦Ό"), message: Text("\(myText)"), dismissButton: .default(Text("νμΈ")))
                })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
