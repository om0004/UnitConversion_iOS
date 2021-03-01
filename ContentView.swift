//
//  ContentView.swift
//  UnitConversion
//
//  Created by om on 30/01/21.
//

import SwiftUI

struct ContentView: View
{
    @State var inputNumber=0
    @State var outputNumber=0
    @State var value:String=""
    var lengthUnits=["meter","kilometer","feet","yard","miles"]
    var convert:Double
    {
        let input=lengthUnits[inputNumber]
        let output=lengthUnits[outputNumber]
        let ValueOfInput=Double(value) ?? 0
        var ValueOfOutput:Double=0
        if input=="meter"{ValueOfOutput=ValueOfInput*3.28}
        else if input=="kilometer"{ValueOfOutput=ValueOfInput*3280.84}
        else if input=="feet"{ValueOfOutput=ValueOfInput*1}
        else if input=="yard"{ValueOfOutput=ValueOfInput*3}
        else {ValueOfOutput=ValueOfInput*5280}
        if output=="meter"{return ValueOfOutput*0.3048}
        else if output=="feet"{return ValueOfOutput*1}
        else if output=="kilometer"{return ValueOfOutput*0.00030}
        else if output=="yard"{return ValueOfOutput*0.33334375}
        else{return ValueOfOutput*0.00018}
    }
    var body: some View
    {
        NavigationView
        {
            Form
            {
                Section(header:Text("Input Unit"))
                {
                    Picker("input unit",selection:$inputNumber)
                    {
                        ForEach(0..<lengthUnits.count)
                        {
                            Text("\(lengthUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header:Text("Output Unit"))
                {
                    Picker("output unit",selection:$outputNumber)
                    {
                        ForEach(0..<lengthUnits.count)
                        {
                            Text("\(lengthUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section
                {
                    TextField("Enter value:",text:$value)
                }
                Section(header:Text("Your Output"))
                {
                    Text("\(convert,specifier:"%.2f")")
                }
            }
            .navigationBarTitle("Unit Conversion")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
