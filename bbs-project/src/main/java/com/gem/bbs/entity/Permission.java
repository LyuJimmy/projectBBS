package com.gem.bbs.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Permission implements Serializable{
	private static final long serialVersionUID = -4919391432498094286L;
	private Integer id;
    private String name;
    private String type;
    private String url;
    private String percode;
    private Long parentid;
    private String parentids;
    private String sortstring;
    private String available;
}