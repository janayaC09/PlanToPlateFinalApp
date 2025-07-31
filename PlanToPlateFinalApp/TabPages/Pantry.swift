import SwiftUI

struct Pantry: View {
    @State private var ingredientName: String = ""
    @State private var ingredientQuantity: String = ""
    @State private var pantryItems: [(name: String, quantity: String)] = []

    @State private var applianceInput: String = ""
    @State private var appliances: [String] = []

    @State private var groceryInput: String = ""
    @State private var groceryList: [String] = []

    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    
                    Text("Pantry")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.custom("InriaSans-Bold", size: 35))
                        .padding(.top, 30)
                        .padding(.bottom, 20)
                        .frame(maxWidth: .infinity)
                    
                    Group {
                        Text("Pantry Ingredients")
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Bold", size: 25))
                        
                        TextField("Ingredient name", text: $ingredientName)
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Regular", size: 18))
                        
                        TextField("Quantity", text: $ingredientQuantity)
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Regular", size: 18))
                        
                        Button("Add Ingredient") {
                            if !ingredientName.isEmpty && !ingredientQuantity.isEmpty {
                                pantryItems.append((ingredientName, ingredientQuantity))
                                ingredientName = ""
                                ingredientQuantity = ""
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.mint)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        
                        ForEach(pantryItems.indices, id: \.self) { index in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(pantryItems[index].name)
                                        .foregroundColor(.white)
                                        .font(.custom("InriaSans-Bold", size: 20))
                                    Text("Quantity: \(pantryItems[index].quantity)")
                                        .foregroundColor(.white.opacity(0.8))
                                        .font(.custom("InriaSans-Regular", size: 16))
                                }
                                Spacer()
                                Button(action: {
                                    pantryItems.remove(at: index)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    
                    Group {
                        Text("Your Appliances")
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Bold", size: 25))
                        
                        TextField("Enter appliance (e.g., Air Fryer)", text: $applianceInput)
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Regular", size: 18))
                        
                        Button("Add Appliance") {
                            if !applianceInput.isEmpty {
                                appliances.append(applianceInput)
                                applianceInput = ""
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.mint)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        
                        ForEach(appliances.indices, id: \.self) { index in
                            HStack {
                                Text(appliances[index])
                                    .foregroundColor(.white)
                                    .font(.custom("InriaSans-Regular", size: 18))
                                Spacer()
                                Button(action: {
                                    appliances.remove(at: index)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    
                    Group {
                        Text("Grocery List")
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Bold", size: 25))
                        
                        TextField("Enter grocery item", text: $groceryInput)
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Regular", size: 18))
                        
                        Button("Add to Grocery List") {
                            if !groceryInput.isEmpty {
                                groceryList.append(groceryInput)
                                groceryInput = ""
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.mint)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        
                        ForEach(groceryList.indices, id: \.self) { index in
                            HStack {
                                Text(groceryList[index])
                                    .foregroundColor(.white)
                                    .font(.custom("InriaSans-Regular", size: 18))
                                Spacer()
                                Button(action: {
                                    groceryList.remove(at: index)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    
                    Spacer(minLength: 100)
                }
                .padding(.horizontal)
            }
            .background(
                Image("Plan to Plate Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
        }
    }
}
#Preview{
    Pantry()
}
