import SwiftUI

struct WeatherHeaderView: View {
    @ObservedObject var viewModel: WeatherViewModel
    let settingsAction: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: symbolName)
                .font(.system(size: 28, weight: .semibold))
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.blue)
                .frame(width: 38, height: 38)

            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 6) {
                    Text(primaryText)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.primary)
                        .lineLimit(1)

                    if viewModel.isLoading {
                        ProgressView()
                            .controlSize(.small)
                            .scaleEffect(0.62)
                    }
                }

                Text(secondaryText)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }

            Spacer(minLength: 8)

            Button {
                viewModel.refresh()
            } label: {
                Image(systemName: "arrow.clockwise")
            }
            .buttonStyle(.plain)
            .accessibilityLabel("刷新天气")

            Button(action: settingsAction) {
                Image(systemName: "gearshape")
            }
            .buttonStyle(.plain)
            .accessibilityLabel("天气设置")
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }

    private var symbolName: String {
        viewModel.weather?.symbolName ?? "cloud.sun.fill"
    }

    private var primaryText: String {
        guard let weather = viewModel.weather else {
            return viewModel.settings.isReady ? "天气" : "未配置天气"
        }

        return "\(weather.cityName) \(weather.temperature)°"
    }

    private var secondaryText: String {
        if let errorMessage = viewModel.errorMessage {
            return errorMessage
        }

        guard let weather = viewModel.weather else {
            return viewModel.settings.provider.displayName
        }

        return "\(weather.condition) · \(weather.providerName)"
    }
}

struct WeatherHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHeaderView(viewModel: WeatherViewModel(), settingsAction: {})
            .padding()
            .frame(width: 360)
    }
}
