# Why moving to R?


A typical *analysis path* implies:
<br>

1. Manage data: cleaning, reformatting  with **EXCEL**  ![](../assets/img/excel-icon.jpg) ;

2. Analysis: produce graphs with **EXCEL**  ![](../assets/img/excel-icon.jpg) and maps with **ArcGIS**  ![](../assets/img/ArcGIS.jpg);

3. Write up to publish in **WORD**  ![](../assets/img/word-icon.jpg) , **PUBLISHER** ![](../assets/img/Publisher.png) or **INDESIGN**  ![](../assets/img/Adobe_InDesign_icon.png).


**Though** when managing numerous analysis, this workflow is **not** the most effective:

- Data are manipulated through "point-and-click user interfaces"...

- Data are sent from a software to another (Excel, GIS, Word...) using different formats!

- All results (figures, tables) are **manually** imported to the final publishing system...

## Recurrent problems brought by the broken workflow

- What analysis is **behind the figure**? Did it accounts for [...] in the analysis?

- What **dataset** was used (e.g. final vs preliminary dataset)?

- Oops, there is an error in the data. Can we **repeat the analysis**? And update quickly the figures, graphs and tables in the report and the presentation!

- As a coauthor/reader, one would like to see the whole **research process** (how we arrived to that conclusion), rather than cooked manuscript with inserted tables/figures.


## Simple rules for Reproducible Research

 1. For every result, **keep track** of how it was produced

 2. **Avoid manual data manipulation** steps

 3. **Archive** the exact versions of all external programs used

 4. **Version control** all custom scripts

 5. **Record all intermediate results**, when possible in standardized formats

 6. For analyses that include randomness, **note underlying random seeds**

 7. Always **store raw data** behind plots

 8. Generate hierarchical analysis output, allowing layers of increasing detail to be inspected

 9.  Connect **textual statements** to underlying results

 10. Provide **public access** to scripts, runs, and results


## Enabling a complete analysis workflow

Rather than through "clicking", all steps DATA + ANALYSIS + PLOT + MAP + NARRATIVE should rather be written in a few script:

 - If spotting error in the data, or using different dataset, make changes in the script and report will update automatically;

 - Data management will be *de facto* fully documented (no more manual changes in Excel);

 - Analysis would as well be documented and will be ready for any kind of collaborative review;

 - Plenty of customisation options will be available and will give a professional look and feel to the final product.


# As a result:


### Analysis becomes streamlined and reproducible! ###

### A "collaboration mode" is enabled from the begining of the process! ###



