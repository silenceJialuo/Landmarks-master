import SwiftUI

struct LandmarkDetail: View {
  @EnvironmentObject var modelData: ModelData
  var landmark: Landmark

  var landmarkIndex: Int {
    modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
  }

  var body: some View {
    ScrollView {
      MapView(coordinate: landmark.locationCoordinate)
        .ignoresSafeArea(edges: .top)
        .frame(height: 300)

      CircleImage(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)

      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
          FavoriteButton(
            isSet: $modelData.landmarks[landmarkIndex].isFavorite
          ).accessibilityIdentifier("favorite")
        }
        // Mocked rating score
        HStack(spacing: 4) {
          ForEach(0..<5) { index in
            Image(systemName: index < 4 ? "star.fill" : "star")
              .foregroundColor(index < 4 ? .yellow : .gray)
          }
          Text("4.0")
            .font(.subheadline)
            .foregroundColor(.secondary)
        }

        HStack {
          Text(landmark.park)
          Spacer()
          Text(landmark.state)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)

        Divider()

        Text("About \(landmark.name)")
          .font(.title2)
        Text(landmark.description)
      }
      .padding()
    }
    .navigationTitle(landmark.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static let modelData = ModelData()

  static var previews: some View {
    LandmarkDetail(landmark: modelData.landmarks[1])
      .environmentObject(modelData)
  }
}