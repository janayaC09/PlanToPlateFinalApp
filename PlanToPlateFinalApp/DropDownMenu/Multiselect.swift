import SwiftUI
struct DropdownMenuMultiSelect: View {
    @State private var isOptionsPresented: Bool = false
    @Binding var selectedOptions: [MenuOptions]
    
    let placeholder: String
    let options: [MenuOptions]
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    isOptionsPresented.toggle()
                }
            }) {
                HStack {
                    if selectedOptions.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Bold", size: 40))
                    } else {
                        Text(selectedOptions.map { $0.option }.joined(separator: ", "))
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Bold", size: 40))
                    }
                    Spacer()
                    Image(systemName: isOptionsPresented ? "chevron.up" : "chevron.down")
                        .foregroundColor(.white)
                }
                .padding()
               // .background(Color.black.opacity(0.3))
                .cornerRadius(8)
            }

            if isOptionsPresented {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(options) { option in
                        HStack {
                            Image(systemName: selectedOptions.contains(option) ? "checkmark.square.fill" : "square")
                                .foregroundColor(.mint)
                            Text(option.option)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if let index = selectedOptions.firstIndex(of: option) {
                                selectedOptions.remove(at: index)
                            } else {
                                selectedOptions.append(option)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding(.horizontal)
                .cornerRadius(8)
            }
        }
        .padding(.horizontal)
    }
}

