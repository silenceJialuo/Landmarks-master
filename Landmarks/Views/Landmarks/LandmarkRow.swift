import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark

  var body: some View {
    HStack {
      landmark.image
        .resizable()
        .frame(width: 50, height: 50)
      Text(landmark.name)
        .accessibilityHidden(true)
        
      // show landmark description also. max one line with tooltip to showup full description
        Text(landmark.description)
        .font(.subheadline)
        .lineLimit(1)
        .foregroundColor(.gray)
        .accessibilityHidden(true)
        
      Spacer()

      if landmark.isFavorite {
        Image(systemName: "star.fill")
          .foregroundColor(.yellow)
          .accessibilityHidden(true)
      }
    }
  }
}

struct LandmarkRow_Previews: PreviewProvider {
  static var landmarks = ModelData().landmarks

  static var previews: some View {
    Group {
      LandmarkRow(landmark: ModelData().landmarks[0])
      LandmarkRow(landmark: ModelData().landmarks[1])
    }
    .previewLayout(.fixed(width: 250, height: 70))
  }
}
