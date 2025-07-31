import SwiftUI

struct FirstPage: View {

    //For the percent bar
    @State var percent: CGFloat = 20
    //For the selected diet array
    @State private var selectedDiet: [MenuOptions] = []
    //for the selcted allergies array
    @State private var selectedAllergies: [MenuOptions] = []
    //the if statements for the selection
    @State private var dietSelected = false
    @State private var allergiesSelected = false
    //for the custom text box
    @State private var customInput: String = ""
    @State private var customInputEntered = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                //background image
                BackgroundView()
                
                VStack {                    VStack(spacing: 10) {
                        Text("\(Int(percent))%")
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Bold", size: 20))
                            .padding(.top, 20)
                        
                        ProgressBar(width: 300, height: 30, percent: percent, color1: .indigo, color2: .mint)
                            .padding(.horizontal)
                        
                        Text("Getting to know YOU")
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Bold", size: 35))
                            .padding(.top, 20)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        DropdownMenuMultiSelect(
                            selectedOptions: $selectedDiet,
                            placeholder: "Diet",
                            options: MenuOptions.testAllOptions
                        )
                        .onChange(of: selectedDiet) { newValue in
                            if !newValue.isEmpty && !dietSelected {
                                percent += 20
                                dietSelected = true
                            }
                        }
                        
                        DropdownMenuMultiSelect(
                            selectedOptions: $selectedAllergies,
                            placeholder: "Allergies",
                            options: MenuOptions.testAllOptionsA
                        )
                        .onChange(of: selectedAllergies) { newValue in
                            if !newValue.isEmpty && !allergiesSelected {
                                percent += 20
                                allergiesSelected = true
                            }
                        }
                        
                        //Goals aspect
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Goals:")
                                .foregroundColor(.white)
                                .font(.custom("InriaSans-Bold", size: 40))
                                .padding()
                            
                            TextField("Type your goals here...", text: $customInput)
                                .padding()
                                .font(.custom("InriaSans-Bold", size: 20))
                                .background(Color.black.opacity(0.15))
                                .cornerRadius(8)
                                .foregroundColor(.white)
                                .onChange(of: customInput) { newValue in
                                    if !newValue.isEmpty && !customInputEntered {
                                        percent += 20
                                        customInputEntered = true
                                    }
                                }
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    // Navigation link button
                    NavigationLink(destination:
                        SecondPage()
                            .navigationBarBackButtonHidden(true)
                    ) {
                        Text("Next")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.indigo)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 30)
                }
            }
        }
    }
}
#Preview {
    FirstPage()
}

