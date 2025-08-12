---
title: "{{ replace .Name "-" " " | title }}"
type: "propietat"
summary: "Apartament acollidor a Lanzarote amb vistes al mar."
preu: 120
capacitat: 4
habitacions: 2
banys: 1
superficie: 65
zona: ["Costa Teguise"]
amenitats: ["piscina","wifi","aire condicionat","aparcament"]
imatges:
  - "/images/{{ .Name }}/1.jpg"
  - "/images/{{ .Name }}/2.jpg"
coords:
  lat: 28.998
  lng: -13.485
featured: false
draft: true
---
Descripció llarga de la propietat…