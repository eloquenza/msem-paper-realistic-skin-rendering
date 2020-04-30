# Realistic real-time rendering of skin under consideration of physical foundation

> Modern LaTeXing with [LNCS](http://www.springer.com/computer/lncs) via [Simplified LNCS Template](https://github.com/eloquenza/LNCS/).

## TOC

<!-- toc -->

- [Background](#background)
- [Development](#development-)

<!-- tocstop -->

## Background

Under the typical Phong reflection model, it is difficult to realistically render various materials such as marble, wax, leaves or skin.
This is based on the fact that the Phong model is only an empirical model and by no means a physically accurate model, which means that a wide variety of physical effects cannot be simulated.
This paper will shed light on the difficulties involved in rendering skin realistically and the concepts that help to reproduce this realism.
Skin as a medium is particularly suitable for approaching these concepts as every reader will hopefully be familiar with a realistic presentation of them.
For this purpose, it is first shown how light interacts with skin in order to work out which image processing concepts are necessary to compensate for the deficits of the Phong model.
Subsequently, physically-based illumination models are presented, which can realistically simulate the reflection of light through the skin and the penetration of light into the skin.
For that the bidirectional reflection distribution function of Kelemen and Szirmay-Kalos, which is responsible for the realistic surface reflection, and subsurface scattering, which simulates the entry and subsequent exit of light into the skin as realistically as possible, are presented.
In the following, images of different implementations will be compared to each other in order to better assess the effect of these concepts.

## Compiling the paper

Inside this repository is a Makefile which can be used to compile the paper by typing `make` into a shell.
Check [Makefile](Makefile) for more commands.

## Development

### Q: How to reindent the lines in my .tex files?:

```shell
latexindent -y="indentPreamble:1,defaultIndent:'  '" -m -w paper.tex`
```

OR

```shell
make indent
```

### Q: How can I reformat my .tex files?

Execute following command:

```shell
latexindent -l -s -sl -w paper.tex
```

OR

```shell
make format
```

### Q: I want to obey the one-sentence-per-line rule. How can I do that?

Execute following command:

```shell
latexindent -m -l -s -sl -w paper.tex
```

OR

```shell
make split-sentences
```

Attention! This is work in progress.
