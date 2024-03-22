package com.adidas.pojos.delete;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Delete{
	@JsonProperty("href")
	private String href;

	@JsonGetter
	public String getHref(){
		return href;
	}
}
