// Pantalla inicial de Pausa. Presenta la idea de la aplicación y permite comenzar.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue.opacity(0.18), .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(spacing: 24) {
                    Spacer()

                    ZStack {
                        Circle().fill(.white.opacity(0.8)).frame(width: 170, height: 170)
                        Image(systemName: "leaf.fill")
                            .font(.system(size: 80))
                            .foregroundStyle(.green)
                    }

                    Text("Pausa")
                        .font(.system(size: 44, weight: .bold, design: .rounded))

                    Text("Un pequeño descanso puede cambiar tu día.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 35)

                    NavigationLink(destination: ActivityView()) {
                        Text("Comenzar")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal, 42)
                    // NavigationLink realiza la transición hacia la segunda pantalla.

                    Spacer()
                    Text("Copyright © 2026 Tu Nombre")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview { ContentView() }
