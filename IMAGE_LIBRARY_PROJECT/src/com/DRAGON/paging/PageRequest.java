package com.DRAGON.paging;

import com.DRAGON.sort.Sorter;

public class PageRequest implements Pageable {

	private Integer page;
	private Integer maxPageItem;
	private Sorter sorter;

	public PageRequest() {
		super();
	}

	public PageRequest(Integer page, Integer maxPageItem, Sorter sorter) {
		super();
		this.page = page;
		this.maxPageItem = maxPageItem;
		this.sorter = sorter;
	}

	@Override
	public Integer getPage() {
		return this.page;
	}

	@Override
	public Integer getOffset() {
		if (this.page != null && this.maxPageItem != null) {
			return (this.page - 1) * this.maxPageItem;
		}
		return null;

	}

	@Override
	public Integer getLimit() {
		return this.maxPageItem;
	}

	@Override
	public Sorter getSorter() {
		if (this.sorter != null) {
			return this.sorter;
		}
		return null;
	}

}
