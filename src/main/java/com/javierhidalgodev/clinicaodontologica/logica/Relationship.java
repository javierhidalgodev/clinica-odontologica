package com.javierhidalgodev.clinicaodontologica.logica;

/**
 *
 * @author Javi
 */
public enum Relationship {
    GRADO1("grade1", "Padre/Madre"),
    GRADO2("grade2", "Hermano/a - Abuelo/a"),
    GRADO3("grade3", "Tío/a"),
    OTRO("other", "Otro");
    
    private String relationship;
    private String relationshipDescription;
    
    private Relationship(String relationship, String relationshipDescription) {
        this.relationship = relationship;
        this.relationshipDescription = relationshipDescription;
    }

    public String getRelationship() {
        return relationship;
    }

    public String getRelationshipDescription() {
        return relationshipDescription;
    }
}
