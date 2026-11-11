import AppKit
import Foundation

let directory = FileManager.default.homeDirectoryForCurrentUser
    .appendingPathComponent(".dotfiles/bin/theme-switcher")

func isDarkMode() -> Bool {
    UserDefaults.standard.string(forKey: "AppleInterfaceStyle") == "Dark"
}

func runScript(for isDark: Bool) {
    let script = directory.appendingPathComponent(
        isDark ? "dark.sh" : "light.sh"
    )

    guard FileManager.default.isExecutableFile(atPath: script.path) else {
        print("Script not found : \(script.path)")
        return
    }

    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/bin/zsh")
    process.arguments = [script.path]

    do {
        try process.run()
        print("Exec : \(script.lastPathComponent)")
    } catch {
        print("Erreur : \(error)")
    }
}

var currentMode = isDarkMode()

func updateTheme() {
    let newMode = isDarkMode()

    guard newMode != currentMode else { return }

    currentMode = newMode
    runScript(for: newMode)
}

DistributedNotificationCenter.default.addObserver(
    forName: Notification.Name("AppleInterfaceThemeChangedNotification"),
    object: nil,
    queue: .main
) { _ in
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        updateTheme()
    }
}

NSWorkspace.shared.notificationCenter.addObserver(
    forName: NSWorkspace.didWakeNotification,
    object: nil,
    queue: .main
) { _ in
    updateTheme()
}

print("Theme Switcher démarré")
runScript(for: currentMode)

NSApplication.shared.setActivationPolicy(.prohibited)
NSApplication.shared.run()
