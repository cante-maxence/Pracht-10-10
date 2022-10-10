<script setup lang="ts">

import type { ChaussureSvg } from "@/types-svg";

withDefaults(defineProps<ChaussureSvg>(),{

    orientation: "cote",
    bandes:"bleu",
    cuir: "bleu",
    mousse:"bleu",
});
</script>

<template>
<img class="relative">
<img :src="'/images/${orientation}/base.png'" class="h-auto w-full"/>


</template>