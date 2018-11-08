
struct Model {
    let name: String
    let generation: Generation
}

extension Model {
    static let models: [Model] = [
        Model(name: "901 (1964)", generation: Generation.find(name: "911 F (1965-1973)")),
        Model(name: "911 (1964-1973)", generation: Generation.find(name: "911 F (1965-1973)")),
        Model(name: "911 991 (2012-2014)", generation: Generation.find(name: "991 (2012-2015)")),
        Model(name: "911 991 (2012-2015)", generation: Generation.find(name: "991 (2012-2015)")),
        Model(name: "911 Carrera (1974-1977/1984-1989)", generation: Generation.find(name: "911 G (1974-1989)")),
        Model(name: "911 SC (1978-83)", generation: Generation.find(name: "911 G (1974-1989)")),
        Model(name: "911 Turbo (1974-89)", generation: Generation.find(name: "911 G (1974-1989)")),
        Model(name: "911/911S (1974-77)", generation: Generation.find(name: "911 G (1974-1989)")),
        Model(name: "912 (1965-1969)", generation: Generation.find(name: "911 F (1965-1973)")),
        Model(name: "912 E (1976)", generation: Generation.find(name: "911 G (1974-1989)")),
        Model(name: "964 (1989-1993)", generation: Generation.find(name: "964 (1989-1994)")),
        Model(name: "964 Turbo (1991-1993)", generation: Generation.find(name: "964 (1989-1994)")),
        Model(name: "991.2 (2015-)", generation: Generation.find(name: "991.2 (2015-)")),
        Model(name: "991.2 (2017-)", generation: Generation.find(name: "991.2 (2015-)")),
        Model(name: "993 (1994-1998)", generation: Generation.find(name: "993 (1994-1998)")),
        Model(name: "993 Turbo (1995-1998)", generation: Generation.find(name: "993 (1994-1998)")),
        Model(name: "996 (1998-2005)", generation: Generation.find(name: "996 (1998-2005)")),
        Model(name: "996 Turbo (2001-2005)", generation: Generation.find(name: "996 (1998-2005)")),
        Model(name: "997 (2005-20011)", generation: Generation.find(name: "997 (2005-2011)")),
        Model(name: "997 Turbo (2007-2011)", generation: Generation.find(name: "997 (2005-2011)")),
    ]
}

extension Model {
    static func find(name: String) -> Model {
        return Model.models.first(where: { $0.name == name })!
    }
}

extension Model {
    var versions: [Version] {
        return Version.versions.filter({ $0.model.name == self.name })
    }
}
