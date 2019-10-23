//
//  ContentView.swift
//  PickerViewMLEmblems
//
//  Created by Oshyn on 10/22/19.
//  Copyright © 2019 Oshyn. All rights reserved.
//

import SwiftUI
import MLFragments2_0

struct ContentView: View {
    
    @State private var emblemIndex = 0
    @State private var nextDate = "hllo"
   
    
    let emblemFighter = Emblems.Fighter
    var body: some View {
        
        NavigationView {
            Form {
                      Section {
                                 Picker(selection: $emblemIndex, label: Text("Emblem")) {
                                            ForEach(0 ..< emblemsRawValueArray.count) {
                                                Text(emblemsRawValueArray[$0])
                                            }
                                        }
                             }
                Section{
                    Button(action: {
                         var embDater: EmblemDater = EmblemDater(dateFromatAdapter: DateFormatterWrapper())
                      
                       
                        let dateFormatWrapper = DateFormatterWrapper()
                        let stringDate = dateFormatWrapper.string(date: Date())
                          
                        self.nextDate =                      embDater.getNextAvailableDateFor(emblem: Emblems(rawValue: emblemsRawValueArray[self.emblemIndex])!, currentDate: stringDate)
                        
                        
                    }) {
                        Text("Get Date")
                    }
                }
                Section{
                    Text(self.nextDate)
                }
                  }.navigationBarTitle(Text("Emblem"))

        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
