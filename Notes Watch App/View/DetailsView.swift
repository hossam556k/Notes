
import SwiftUI

struct DetailsView: View {

    // MARK: - PROPERTY

    let note: Note
    let count: Int
    let index: Int

    @State private var isCreaditPresented: Bool = false
    @State private var isSettingsPresnetnd: Bool = false

    // MARK: - BODY

    var body: some View {

        VStack(spacing: 8) {

            // HEADER
            HeaderView()

            Spacer()

            // CONTENT
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }

            Spacer()

            // FOOTER
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresnetnd.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresnetnd, content: {
                        Settings()
                    })

                Spacer()

                Text("\(count) / \(index + 1)")

                Spacer()

                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreaditPresented.toggle()
                    }
                    .sheet(isPresented: $isCreaditPresented, content: {
                        CreaditsView()
                    })
            }
            .padding(3)
        }
        .navigationTitle("Details")
    }
}

#Preview {
    DetailsView(
        note: Note(id: UUID(), text: "Hello world"),
        count: 5,
        index: 1
    )
}
