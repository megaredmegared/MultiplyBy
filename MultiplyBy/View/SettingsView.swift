//
//  SettingsView.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var isSettingsViewActive = false
}

extension AppState {

    func restore(from activity: NSUserActivity) {
        guard activity.activityType == Bundle.main.activityType,
            let isSettingsViewActive = activity.userInfo?[Key.isSettingsViewActive] as? Bool
            else { return }

        self.isSettingsViewActive = isSettingsViewActive
    }

    func store(in activity: NSUserActivity) {
        activity.addUserInfoEntries(from: [Key.isSettingsViewActive: isSettingsViewActive])
    }

    private enum Key {
        static let isSettingsViewActive = "isSettingsViewActive"
    }
}

extension Bundle {
    var activityType: String {
        return Bundle.main.infoDictionary?["NSUserActivityTypes"].flatMap { ($0 as? [String])?.first } ?? ""
    }
}

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var game: GameViewModel

    @State private var showingAlert = false

    private var showLanguageButton: Bool {
        return Locale.preferredLanguages.count > 1 ? true : false
    }

    private var language: String {

        let language = Bundle.main.preferredLocalizations.first ?? "None"
        switch language {
        case "fr":
            return "Français"
        default:
            return "English"
        }
    }

    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack(spacing: 30) {
                    Text(Translation.titleOfTheSettingsView.rawValue, comment: "Titles for the settings View")
                        .roundedText(size: geo.size.width * 0.08, weight: .black)

                    Spacer()

                    if showLanguageButton {
                        Button {
                            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                        } label: {
                            Text("\(language)")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(MainButtonStyle())
                    }

                    VStack(spacing: 10) {
                        Text(Translation.saveSelectedTablesInfos.rawValue).roundedText(size: 15, weight: .bold)
                            .foregroundColor(.gray)

                        Button {
                            showingAlert = (try? game.saveChoosenTables()) != nil
                        } label: {
                            Text(Translation.yesButtonLabel.rawValue).frame(maxWidth: .infinity)
                        }
                        .buttonStyle(MainButtonStyle())
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text(Translation.selectedTablesSavedTitleMessage.rawValue),
                                message: Text(Translation.selectedTablesSavedMessage.rawValue),
                                dismissButton: .default(Text(Translation.okButtonLabel.rawValue))
                            )
                        }
                    }

                    Spacer()

                    BackButton()
                }
            .padding()
            .frame(maxWidth: 600)
            }
        }
        .deleteNavBar()
        .statusBar(hidden: true) // iOS 14.0 fix
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
