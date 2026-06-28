import SwiftUI

struct WeatherSettingsView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @Environment(\.dismiss) private var dismiss

    @AppStorage(WeatherDefaults.providerKey) private var provider = WeatherProvider.amap.rawValue
    @AppStorage(WeatherDefaults.apiKeyKey) private var apiKey = ""
    @AppStorage(WeatherDefaults.cityCodeKey) private var cityCode = "110000"
    @AppStorage(WeatherDefaults.cityNameKey) private var cityName = "北京"

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("天气")
                    .font(.system(size: 18, weight: .semibold))

                Spacer()

                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                .buttonStyle(.plain)
                .accessibilityLabel("关闭")
            }

            Picker("服务商", selection: $provider) {
                ForEach(WeatherProvider.allCases) { provider in
                    Text(provider.displayName).tag(provider.rawValue)
                }
            }
            .pickerStyle(.segmented)

            VStack(alignment: .leading, spacing: 10) {
                LabeledContent("API Key") {
                    SecureField("API Key", text: $apiKey)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 210)
                }

                LabeledContent("城市编码") {
                    TextField("110000", text: $cityCode)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 210)
                }

                LabeledContent("城市名称") {
                    TextField("北京", text: $cityName)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 210)
                }
            }

            HStack {
                Spacer()

                Button("保存") {
                    viewModel.reloadSettings()
                    dismiss()
                }
                .keyboardShortcut(.defaultAction)
            }
        }
        .padding(20)
        .frame(width: 360)
    }
}

struct WeatherSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSettingsView(viewModel: WeatherViewModel())
    }
}
