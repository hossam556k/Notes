//
//  ContentView.swift
//  Notes Watch App
//ـ 
//  Created by MacBook Pro on 01/11/2026.
//


import SwiftUI

struct ContentView: View {

    // MARK: - PROPERTY

    @AppStorage("lineCount") var lineCount: Int = 1
    
    @State private var notes = [Note]()
    @State private var text: String = ""

    // MARK: - DOCUMENT DIRECTORY

    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )

        return path[0]
    }

    // MARK: - SAVE NOTES

    func save() {
        do {
            let data = try JSONEncoder().encode(notes)

            let url = getDocumentDirectory()
                .appendingPathComponent("notes")

            try data.write(to: url, options: .atomic)

        } catch {
            print("Saving data failed: \(error.localizedDescription)")
        }
    }

    // MARK: - LOAD NOTES

    func load() {
        do {
            let url = getDocumentDirectory()
                .appendingPathComponent("notes")

            let data = try Data(contentsOf: url)

            notes = try JSONDecoder().decode(
                [Note].self,
                from: data
            )

        } catch {
            print("Loading data failed: \(error.localizedDescription)")
        }
    }

    // MARK: - DELETE NOTES

    func delete(offset: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offset)
            save()
        }
    }

    // MARK: - BODY

    var body: some View {

        NavigationStack {

            VStack {

                // ADD NEW NOTE

                HStack(alignment: .center, spacing: 6) {

                    TextField("Add New Note", text: $text)

                    Button {

                        guard !text.trimmingCharacters(
                            in: .whitespacesAndNewlines
                        ).isEmpty else {
                            return
                        }

                        let note = Note(
                            id: UUID(),
                            text: text
                        )

                        notes.append(note)

                        text = ""

                        save()

                    } label: {

                        Image(systemName: "plus.circle")
                            .font(.system(size: 22, weight: .semibold))

                    }
                    .fixedSize()
                    .buttonStyle(.plain)
                    .foregroundColor(.accentColor)
                }

                Spacer()

                // NOTES LIST

                List {

                    ForEach(
                        Array(notes.enumerated()),
                        id: \.element.id
                    ) { index, note in

                        NavigationLink {

                            DetailsView(
                                note: note,
                                count: notes.count,
                                index: index
                            )

                        } label: {

                            HStack {

                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)

                                Text(note.text)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5)
                            }
                        }
                    }
                    .onDelete(perform: delete)
                }

                // NOTES COUNT

                Text("\(notes.count)")
            }
            .navigationTitle("Notes")
            .onAppear {
                load()
            }
        }
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
