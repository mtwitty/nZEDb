
<h1>{$page->title}</h1>

<p><b>Jump to</b>:
&nbsp;&nbsp;[ <a href="{$smarty.const.WWW_TOP}/series" title="View available TV series">Series List</a> ]
&nbsp;&nbsp;[ <a href="{$smarty.const.WWW_TOP}/myshows/browse">Browse My Shows</a> ]
<br />Your shows can also be downloaded as an <a href="{$smarty.const.WWW_TOP}/rss?t=-3&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}">Rss Feed</a>.
</p>

{if $shows|@count > 0}

<table class="data highlight Sortable" id="browsetable">
	<tr>
		<th width="35%">name</th>
		<th>feed</th>
		<th>category</th>
		<th>added</th>
 		<th class="mid">options</th>
	</tr>

	{foreach from=$shows item=show}
		<tr class="{cycle values=",alt"}">
			<td>
				<a title="View details" href="{$smarty.const.WWW_TOP}/series/{$show.rageID}{if $show.categoryID != ''}?t={$show.categoryID|replace:"|":","}{/if}">{$show.releasetitle|escape:"htmlall"|wordwrap:75:"\n":true}</a>
			</td>
			<td><a href="{$smarty.const.WWW_TOP}/rss?rage={$show.rageID}&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}" title="RSS Feed for {$show.releasetitle|escape:"htmlall"} (All Categories)">RSS Feed</td>
			<td class="less">{if $show.categoryNames != ''}{$show.categoryNames|escape:"htmlall"}{else}All{/if}</td>
			<td class="less" title="Added on {$show.createddate}">{$show.createddate|date_format}</td>
			<td class="mid"><a href="{$smarty.const.WWW_TOP}/myshows/edit/{$show.rageID}" class="myshows" rel="edit" name="series{$show.rageID}" title="Edit Categories">Edit</a>&nbsp;&nbsp;<a href="{$smarty.const.WWW_TOP}/myshows/delete/{$show.rageID}" class="myshows" rel="remove" name="series{$show.rageID}" title="Remove from My Shows">Remove</a></td>
		</tr>
	{/foreach}
	
</table>

{else}
<h2>No shows bookmarked</h2>
{/if}