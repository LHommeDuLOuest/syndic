package org.syndic.client.web.command;

/**
 * Created by leite_2 on 15/12/2015.
 */
public class ProviderCommand
{
    private int id;
    private String nameProvider;
    private String description;
    private String dateCreation;

    public ProviderCommand(String dateCreation, String name, String description, int id) {
        this.dateCreation = dateCreation;
        this.nameProvider = name;
        this.description = description;
        this.id = id;
    }

    public ProviderCommand() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return nameProvider;
    }

    public void setName(String name) {
        this.nameProvider = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(String dateCreation) {
        this.dateCreation = dateCreation;
    }
}