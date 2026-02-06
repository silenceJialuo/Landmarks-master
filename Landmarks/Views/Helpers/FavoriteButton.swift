import SwiftUI

struct FavoriteButton: View {
  @Binding var isSet: Bool

  var body: some View {
    Button {
      isSet.toggle()
    } label: {
      Image(systemName: isSet ? "heart.fill" : "heart")
        .foregroundColor(isSet ? .red : .gray)
        .accessibilityLabel(isSet ? "Remove from favorites" : "Add to favorites")
    }
  }
}

struct FavoriteButton_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteButton(isSet: .constant(true))
  }
}