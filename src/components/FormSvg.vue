<script setup lang="ts">

import type { ChaussureSvg } from "@/types-svg";
import {ref} from "vue";
import SvgProfil from "../svgProfil.vue";
import SvgDessus from "../svgDessus.vue";

const chaussure = ref<ChaussureSvg>({});

</script>

<template>
<di class="p-4">
    <ul class="flex gap-1">
        <li><a href="#profil">Profil</a></li>
        <li><a href="#dessus">Dessus</a></li>
</ul>
<div class="caroussel w-64">
    <SvgProfil class="caroussel-item w-64" v-bind="chaussure" id="profil"/>
    <SvgDessus class="caroussel-item w-64" v-bind="chaussure" id="dessus"/>
</div>

<FormKit type="form" v-model="chaussure">
<FormKit name="semelle" label="semelle" value="#FFFFFF" type="color"  />
<FormKit name="empeigne" label="empeigne" value="#FFFFFF" type="color"  />
<FormKit name="pointe" label="pointe" value="#FFFFFF" type="color"  />
<FormKit name="oeillet" label="oeillet" value="#FFFFFF" type="color"  /> 
<FormKit name="bande" label="bande" value="#FFFFFF" type="color"  /> 
<FormKit name="languette" label="languette" value="#FFFFFF" type="color"  /> 
<FormKit name="lacet" label="lacet" value="#FFFFFF" type="color"  />
<FormKit name="trimestre" label="trimestre" value="#FFFFFF" type="color"  />
</template>
