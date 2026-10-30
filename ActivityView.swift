// Segunda pantalla: una actividad de respiración de 30 segundos.

import SwiftUI

struct ActivityView: View {
    @State private var seconds = 30
    @State private var isRunning = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 24) {
            Text("Respiración consciente")
                .font(.title2.bold())

            Text("Inspira lentamente y después expulsa el aire.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)

            ZStack {
                Circle().stroke(.blue.opacity(0.15), lineWidth: 20)
                Circle()
                    .trim(from: 0, to: CGFloat(seconds) / 30)
                    .stroke(.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: seconds)
                Text("\(seconds)").font(.system(size: 48, weight: .bold, design: .rounded))
            }
            .frame(width: 220, height: 220)

            Button(isRunning ? "Pausar" : "Comenzar actividad") {
                isRunning.toggle()
            }
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(isRunning ? .orange : .blue)
            .clipShape(Capsule())

            Button("Reiniciar") {
                seconds = 30
                isRunning = false
            }
            .foregroundStyle(.blue)

            Spacer()
        }
        .padding(28)
        .navigationTitle("Tu pausa")
        .navigationBarTitleDisplayMode(.inline)
        .onReceive(timer) { _ in
            // El contador solo avanza mientras la actividad está activa.
            guard isRunning else { return }
            if seconds > 0 { seconds -= 1 }
            else { isRunning = false }
        }
    }
}

#Preview { NavigationStack { ActivityView() } }
