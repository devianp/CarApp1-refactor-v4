
struct ModelSet {
    let ModelGeneration: String
    let ModelSubset: String
    let ModelVersions: [Model]
}

extension ModelSet {
    static var ModelGeneration1: [ModelSet] {
        return [
            ModelSet(ModelGeneration: "911 F (1965-1973)", ModelSubset: "901 (1964)", ModelVersions: [
                Model(modelId: "1", modelGeneration: "911 F (1965-1973)", model: "901 (1964)", version: "901 (1964)")]),

            ModelSet(ModelGeneration: "911 F (1965-1973)", ModelSubset: "911 (1964-1973)", ModelVersions: [
                Model(modelId: "2", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 2.0 (1965-67)"),
                Model(modelId: "3", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 2.0 Targa (1967)"),
                Model(modelId: "4", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 S 2.0, 911 S 2.0 Targa (1967-68)"),
                Model(modelId: "5", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 T 2.0, 911 T 2.0 Targa (1968-69)"),
                Model(modelId: "6", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 L 2.0, 911 L 2.0 Targa (1968)"),
                Model(modelId: "7", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 E 2.0, 911 E 2.0 Targa (1969)"),
                Model(modelId: "8", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 S 2.0, 911 S 2.0 Targa (1969)"),
                Model(modelId: "9", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 T 2.2, 911 T 2.2 Targa (1970-71)"),
                Model(modelId: "10", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 E 2.2, 911 E 2.2 Targa (1970-71)"),
                Model(modelId: "11", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 S 2.2, 911 S 2.2 Targa (1970-71)"),
                Model(modelId: "12", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 T 2.4, 911 T 2.4 Targa (1972-73)"),
                Model(modelId: "13", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 E 2.4, 911 E 2.4 Targa (1972-73)"),
                Model(modelId: "14", modelGeneration: "911 F (1965-1973)", model: "911 (1964-1973)", version: "911 S 2.4, 911 S 2.4 Targa (1972-73)")
                ]),

            ModelSet(ModelGeneration: "911 F (1965-1973)", ModelSubset: "912 (1965-1969)", ModelVersions: [
                Model(modelId: "15", modelGeneration: "911 F (1965-1973)", model: "912 (1965-1969)", version: "912 1.6 (1965-69)"),
                Model(modelId: "16", modelGeneration: "911 F (1965-1973)", model: "912 (1965-1969)", version: "912 1.6 Targa (1967-69)")
                ])
        ]
    }
}
