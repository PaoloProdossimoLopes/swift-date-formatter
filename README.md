#  DATE FORMATTER
I studied around the best usefull date formatter to aply in my projects

## 🧰 Example:
```swift
let dateRaw = "2000-03-23"
let formatter: ExtractDateFormatter = .shared
let from: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: .brazilian,
    dateFormat: .defaults(.abreviate)
)
let to: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: .brazilian,
    dateFormat: .defaults(.described(.complete))
)
let config: ExtractDateFormatter.Configuration = .init(
    rawDate: input, from: from, to: to
)
sut.format(config: config) //"quinta-feira, 23 março 2000"
```

## 📃 License:
The MIT license was used in this project.

## Contact:
[![Github](https://img.shields.io/badge/GitHub-black?style=for-the-badge&logo=github&logoColor=white)](https://github.com/PaoloProdossimoLopes)
[![Gmail](https://img.shields.io/badge/Gmail-black?style=for-the-badge&logo=gmail&logoColor=white)](mailto:paolo.prodossimo.lopes@gmail.com)
[![Instagram](https://img.shields.io/badge/Instagram-black?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/ios.dev.br/)
[![Linkedin](https://img.shields.io/badge/LinkedIn-black?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/paoloprodossimolopes/)
[![Medium](https://img.shields.io/badge/Medium-black?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@pprodossimo)
