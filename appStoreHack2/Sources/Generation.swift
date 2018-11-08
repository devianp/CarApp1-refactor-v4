
struct Generation {
    let name: String
    let summary: String
}

extension Generation {
    static let generations: [Generation] = [
        Generation(name: "911 F (1965-1973)", summary: "In September 1963, Porsche presented the Porsche 901 at the IAA in Frankfurt as a successor to the Porsche 356. One year later, as of model year 1965, series production of the model began and it was renamed the 911 shortly thereafter. Originally built only as a Coupé, the 911 had an integral body-frame and was powered by a new 2.0-litre flat-six engine, which initially delivered 130 hp."),
        Generation(name: "911 G (1974 1989)", summary: "For model year 1974, the body design of the Porsche 911 was comprehensively redesigned for the first time. In addition to a Coupé and a Targa version, a Cabriolet was also available as of model year 1983.The most striking feature of this 911 generation is the raised bumper design with black plastic bellows. Between the tail lights of the G models is a red panel and a Porsche logo that is red or black, depending on the model year. The rear number plate is flanked by two large rubber buffers with integrated number plate lighting."),
        Generation(name: "964 (1989–1994)", summary: "The new generation of the 911 came onto the market in model year 1989, at the same time as the phasing-out of the G series. The 911 Carrera 4 type 964 contained 85 percent new parts, but largely retained the classic shape of its predecessor. It was available in the Coupé, Targa and Cabriolet body designs. The 964 had much better aerodynamics than the G model. This was helped in particular by the new round front and rear sections as well as an automatically extending rear spoiler."),
        Generation(name: "991 (2012-2015)", summary: "2012 Porsche introduces the all new 991; longer, lower, and wider and it introduced a new aesthetic to the line. The 991 boasted the world’s first seven-speed manual transmis- sion, new rear suspension, new electromechanical power steering, Porsche Dynamic Chassis Control (pioneered on the Cayenne), and Porsche Torque Vectoring (first seen on the 997.2 Turbo)."),
        Generation(name: "991.2 (2015-)", summary: ""),
        Generation(name: "993 (1994-1998)", summary: "In model year 1994, the 964 model line was replaced by the 993 model line. This was a significant advance, not just from a technical, but also a visual perspective."),
        Generation(name: "996 (1998-2005)", summary: "In 1997, Porsche launched a completely new 911. The classic body was larger and the chassis had been further enhanced. The model also featured a more powerful version of the new water-cooled flat-six engine."),
        Generation(name: "997 (2005-2011)", summary: "Two new 911s were intro- duced for the 2005 model year: the Carrera and Carrera s. While the 997 kept the 1999-2004 996’s chassis and greenhouse as its basis, it ditched the “slab” sides and unusual headlight designs for flared fenders and lights that recalled the air-cooled 993."),
    ]
}

extension Generation {
    static func find(name: String) -> Generation {
        return Generation.generations.first(where: { $0.name == name })!
    }
}
