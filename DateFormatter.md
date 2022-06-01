# 📃 ExtractDateFormatter
Date formatter é a classe do modulo de extrato reponsavel por todas as formataçoes de data nele. <br>
**OBS:** As propriedades/Metodos abordadas aqui sao somentes as ***internal*** e ***public***, ou seja, ***privados*** e ***fileprivate*** nao sao abordadas aqui.

## ℹ️ Informações:

#### Arquivos relacionados
- ExtractDateFormatter.swift
- ExtractFormatBuilder.swift
- ExtarctLocaleOption.swift
- DateFormatterTests.swift

#### Tipo de objeto:
- [ ] Classe
- [x] Estrutura
- [ ] Enum

#### Possui Teste unitario?
- [ ] Não
- [x] Sim. Se sim qual?<br> **R:** DateFormatterTests.swift

## 🔘 Propriedade:
```swift
  static let share: ExtractDateFormatter
  //Propriedade estatica responsavel por dar acesso a metodos internos nao estaticos caracterizado a estrutura como um singleton
```

## 🔘 Metodos:
A sequir os metodos presentes para uso dessa classe e sua funcionalidade.

```swift 
  func format(config: Configuration) -> String 
  //Descrição: 
  //Metodo usado para converter uma data (no tipo texto) para outra data com uma formataçao diferente.
  //
  //Parametros:
  //- config: Configuration 
  //  Model usada para construir a formatação.
  //
  //Retorno:
  //- Tipo: String
  //  Data Formata no formato esperado
```
  
```swift 
  func format(date: Date, toFormat: Configuration.DateConfig) -> String 
  //Descrição: 
  //Metodo usado para converter uma data (do tipo `Date`) em uma data formatada.
  //
  //Parametros:
  //- date: Date
  //- toFormat: Configuration.DateConfig
  //  Usa esse submodelo recebido, para que construa o formatador de conversao expecificado. 
  //
  //Retorno:
  //- Tipo: String
  //  Retorna a data formatada
```

```swift 
  func format(input: String, fromFormat: Configuration.DateConfig) -> Date? 
  //Descrição: 
  //Metodo usado para converter uma data inputada (no tipo texto) em uma data.
  //
  //Parametros:
  //- input: String
  //  Recebe a data que deve ser convertida no formato texto
  //- fromFormat: Configuration.DateConfig
  //  Usa esse submodelo recebido, para que construa o formatador de conversao expecificado e retorne a data no tipo esperado. 
  //
  //Retorno:
  //- Tipo: Date?
  //- Retorna a data no formato nativo para que seja convertido posteriormente.
```

## 🔘 Exemplos de uso:
```swift 
//Exemplo: Formatando formato invertido para o normal padrao brasileiro.
  let input: String = "2022-10-20" 
  let from: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: .unitedState,
    dateFormat: .raw("yyyy-MM-dd")
  )
  let to: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: brazilian,
    dateFormat: .defaults(.abreviate(.standart))
  )
  let config: ExtractDateFormatter.Configuration = .init(
    rawDate: input, from: from, to: to
  )
  ExtractDateFormatter.shared.format(config: config) //Retorno: 20/10/2022
```

```swift 
//Exemplo: Formatando formato invertido para um formato que devolva apenas o dia
  let input: String = "2022/10/20" 
  let from: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: .unitedState,
    dateFormat: .defaults(.abreviate(.inverted))
  )
  let to: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: brazilian,
    dateFormat: .defaults(.fragment(.month)))
  )
  let config: ExtractDateFormatter.Configuration = .init(
    rawDate: input, from: from, to: to
  )
  ExtractDateFormatter.shared.format(config: config) //Retorno: 10
```

```swift 
  //Exemplo: Formatando formato invertido para um formato que devolva o mes descrito completo em protugues br.
  
  let input: String = "2022/10/20" 
  let from: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: .unitedState,
    dateFormat: .defaults(.abreviate(.inverted))
  )
  let to: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: .brazilian,
    dateFormat: .defaults(.fragment(.monthDescribed)))
  )
  let config: ExtractDateFormatter.Configuration = .init(
    rawDate: input, from: from, to: to
  )
  ExtractDateFormatter.shared.format(config: config) //Retorno: Outrubro
```

```swift 
  //Exemplo: Formatando formato invertido para um formato que devolva o mes descrito completo em ingles.
  
  let input: String = "2022/10/20" 
  let from: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: .unitedState,
    dateFormat: .defaults(.abreviate(.inverted))
  )
  let to: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: .unitedState,
    dateFormat: .defaults(.fragment(.monthDescribed)))
  )
  let config: ExtractDateFormatter.Configuration = .init(
    rawDate: input, from: from, to: to
  )
  ExtractDateFormatter.shared.format(config: config) //Retorno: October
```

```swift 
  //Exemplo: Formatando tempo do modo padrao para um formato customizado montado na mao.
  
  let input: String = "10:20:50"
  let from: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: .unitedState,
    dateFormat: .raw("hh:mm:ss")
  )
  let to: ExtractDateFormatter.Configuration.DateConfig = .init(
    localeOption: .brazilian,
    dateFormat: .formatter(
      [.hour(), .separator(.dash), .minute(), .separator(.space), .second()]
    )
  )
  let config: ExtractDateFormatter.Configuration = .init(
    rawDate: input, from: from, to: to
  )
  ExtractDateFormatter.shared.format(config: config) //Retorno: 10-20 50
```

```swift 
  //Exemplo: Formatando
  
```

## 🏷 Informações sobre os modelos Internos
Modelos internos sao classes do objeto reponsaveis pelas padronizar, desencapsular, limitar, direcionar o uso dentre outros motivos.

### Modelo: ExtractDateFormatter.Configuration:
Modelo usado para configurar a mudanca de uma data 'crua' para um formato/estilo especifico.

#### Tipo de objeto:
- [x] Estrutura
- [ ] Enum

```swift
let rawDate: String
//Propriedade que inputa a data do tipo String no formato a ser formatado.
```

```swift
let from: DateConfig
//Configuraçao utilizada para criar o formatador do fromFormatter e devolver uma Data?
```

```swift
let to: DateConfig
//Configuraçao utilizada para criar o formatador do toFormatter e devolver uma String formatada no modelo final.
```

### Modelo: ExtractDateFormatter.Configuration.DateConfig:
Modelo usado pelo formatador na hora de configuralo antes da formataçao em si.

#### Tipo de objeto:
- [x] Estrutura
- [ ] Enum

```swift
var localeOption: ExtractLocaleOption
//Locale é usado para escolher qual o idioma a data estara durante a formataçao.
//Por padrao o 'localeOption = .brazilian'
```
```swift
var dateFormat: ExtractDateFormatter.InputOption
//Éssa informaçao é usada para pegar o formato e configurar o DateFormatter nativo.
//Por padrao o fromato é 'dateFormat = .defaults(.abreviate(.standart))'
```

### Modelo: ExtractDateFormatter.InputOption
Modelo responsavel por escolha dos metodos de formataçao

#### Tipo de objeto:
- [ ] Estrutura
- [x] Enum

```swift
case raw(String)
//Opção usada para colocar 'na mao' o formato que deseja formatar

case defaults(ExtractFormatBuilder.DefaultOption)
//Opção usada para utilizar os modelos ja mapeados pela classe "ExtractFormatBuilder"

case formatter([ExtractFormatBuilder.Format])
//Opção usada para construir "na mao" porem utilizando as estruturas do "ExtractFormatBuilder"

var format: String
//Propriedade computada que devolve o formato correto dependendo da sua escolha de 'case' para construçao do formatador.

```
<br></br>

**Ultima atualizaçao em:** 01/06/2022
