# Labels [SAIL Design System: Guidelines]

*Section: guidance | source: https://docs.appian.com/suite/help/26.7/sail/ux-labels.html | images referenced live in corpus/images/*

# Labels

## Position

Field labels may be shown above the component, adjacent to the component (left- or right-aligned), or not shown at all.

Note that labels are always shown above the component in the mobile application.

![ds-images/uxdg_labels_compared.png](../images/uxdg_labels_compared.png)

*Adjacent-positioned labels may appear ragged or misaligned when shown next to other page content*

## Above

The above-component label position generally works well for form input fields (like textboxes and dropdowns).

For all components, labels above are especially preferable to adjacent when:

- The component is wide (e.g. grids & charts), since adjacent labels take up horizontal space

- The label text is long (to avoid wrapping)

![ds-images/ux_labelPositionAboveDo.png](../images/ux_labelPositionAboveDo.png) **[DO example]**

![ds-images/ux_labelPositionAboveDont.png](../images/ux_labelPositionAboveDont.png) **[DON'T example]**

## Adjacent and justified

Use the adjacent or justified position to show a label next to its corresponding component.

Choose one of these options when:

- Displaying non-editable values, such as record attributes (to enhance visual grouping of labels vs. values, especially when some of the values may be blank)

- The interface has many fields (to minimize vertical scrolling)

![ds-images/ux_label_adjacent_do.png](../images/ux_label_adjacent_do.png) **[DO example]**

![ds-images/ux_label_adjacent_dont.png](../images/ux_label_adjacent_dont.png) **[DON'T example]**

Don't use the above label position for read only values. This makes reading fields with missing values difficult.

The adjacent position right-aligns labels in languages that read left-to-right (like English). This position keeps labels close to the components that they describe and generally allows users to more quickly scan forms than the justified label.

Consider using the justified label in situations where the adjacent label results in visual imbalance of the user interface. Since adjacent labels are right-aligned, shorter labels may appear to be offset from other page content that is left-aligned (such as section headers and above-positioned labels).

![ds-images/uxdg_labels_adjacent.png](../images/uxdg_labels_adjacent.png)

*Adjacent-positioned labels may appear ragged or misaligned when shown next to other page content*

![ds-images/uxdg_labels_justified.png](../images/uxdg_labels_justified.png)

*Justified-positioned labels create more even alignment with other page elements such as section headers*

## Consistency

Avoid mixing different label positions within the same interface or section as this creates an unbalanced layout.

Consider the guidelines for determining label positioning and choose the option that best balances the requirements of all fields.

![ds-images/ux_labels_consistent.png](../images/ux_labels_consistent.png) **[DON'T example]**

## Excluding labels

Field labels may be excluded if they would be redundant. For example, if:

- An interface contains a single grid or chart and the page title sufficiently describes it.

- A section header label sufficiently describes a group of related fields.

Be careful of the accessibility impact of excluding labels. Assistive technologies may expect a text label description of each field.

![ds-images/ux_labels_excluded.png](../images/ux_labels_excluded.png)

If you set *labelPosition* to `"ADJACENT"` or `"ABOVE"`, but do not give a value for *label*, a space still displays for the label. To display the component without a label, use `"COLLAPSED"` for *labelPosition* to avoid unintentionally adding extra spacing.

## Redundant labels

Avoid repeating words when labeling a group of related inputs.

![ds-images/ux_label_redundant_do.png](../images/ux_label_redundant_do.png) **[DO example]**

Use a section header to provide context, allowing for more concise field labels

![ds-images/ux_label_redundant_dont.png](../images/ux_label_redundant_dont.png) **[DON'T example]**

## Label format

Avoid using a colon (":") after a field or section label.

Use consistent capitalization in labels. Title case is recommended.

![ds-images/ux_format_do.png](../images/ux_format_do.png) **[DO example]**

![ds-images/ux_format_dont.png](../images/ux_format_dont.png) **[DON'T example]**

## Consistent tone

Avoid using labels with a conversational tone if other labels on the form are concise and direct.

![alttext](../images/ux_labels_tone_do.png) **[DO example]**

![alttext](../images/ux_labels_tone_dont.png) **[DON'T example]**

## Rich text headers

When displaying rich text headers, use the above label position or exclude the label for proper alignment.

Field labels may be excluded if the headers are sufficient to describe or organize the content.

![alttext](../images/ux_labels_rich_text_do.png) **[DO example]**

![alttext](../images/ux_labels_rich_text_dont.png) **[DON'T example]**

## Link labels

Use descriptive display text for link labels.

Avoid unnecessary or redundant words like "link".

A URL should not be displayed as the link label unless there is an explicit reason for users to see the URL.

![ds-images/ux_labels_links.png](../images/ux_labels_links.png) **[DON'T example]**
