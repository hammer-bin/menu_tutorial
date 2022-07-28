//
//  ContentView.swift
//  menu_tutorial
//
//  Created by minkyuLee on 2022/07/29.
//

import SwiftUI

let MyPets = ["멍멍이 🐶", "야옹이 🐱", "찍찍이 🐭", "토끼 🐰"]

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
                    Text("우측 상단에 땡땡땡을 눌러주세요!")
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()
                }
            
                .padding()
                .navigationTitle("하이요")
                .toolbar(content: {
                    ToolbarItem(placement: .primaryAction,
                        content: {
                        Menu{
                            Button(action: {
                                print("버튼클릭")
                                shouldShowAlert = true
                                myText = "오늘도 개방형클라우드센터"
                            }, label: {
                                Label("오늘도 빡코딩!", systemImage: "flame.fill")
                            })
                            
                            Section{
                                Button {
                                    print("버튼클릭")
                                    shouldShowAlert = true
                                    myText = "오늘은 쉬는날"
                                } label: {
                                    Label("집에서 쉬는날!", systemImage: "flame.fill")
                                }
                            }
                            
                            Section {
                                Button {
                                    
                                }label : {
                                    Label("새파일 만들기", systemImage: "doc")
                                }
                                Button {
                                    
                                }label : {
                                    Label("새폴더 만들기", systemImage: "folder")
                                }
                            }
                            
                            Section {
                                Button {
                                    
                                }label : {
                                    Label("파일 모두 삭제", systemImage: "trash")
                                }
                              
                            }
                            
                            Picker(selection: $selected, label: Text("애완동물 선택")){
                                ForEach(MyPets.indices, id: \.self, content: { index in
                                    Text("\(MyPets[index])").tag(index)
                                })
                            }

                        } label: {
                            Circle().foregroundColor(Color.cyan)
                                .frame(width: 50, height: 50, alignment: .center)
                                .overlay(
                                    Label("더보기", systemImage: "ellipsis")
                                        .font(.system(size: 30))
                                        .foregroundColor(Color.yellow)
                                )
                            
                        } // 메뉴
                    })
                }) // toolbar
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("알림"), message: Text("\(myText)"), dismissButton: .default(Text("확인")))
                })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
