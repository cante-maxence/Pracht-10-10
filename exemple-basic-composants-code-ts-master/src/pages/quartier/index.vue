<script setup lang="ts">
import groupBy from "lodash/groupBy";
import { Disclosure, DisclosureButton, DisclosurePanel } from "@headlessui/vue";
import { supabase } from "../../supabase";
const { data, error } = await supabase.from("quartiercommune").select("*");
if (error) console.log("n'a pas pu charger la table quartiercommune :", error);
</script>

<template>
  <section class="flex flex-col">
    <h3 class="text-2xl">Liste des quartiers par commune</h3>
    <Disclosure
      v-for="(listeQuartier, libelleCommune) in groupBy(
        data,
        'libelle_Commune'
      )"
      :key="libelleCommune"
    >
      <DisclosureButton class="py-2">
        {{ libelleCommune }}
      </DisclosureButton>
      <DisclosurePanel class="text-gray-500">
        <ul>
          <li
            v-for="quartierObject in listeQuartier"
            :key="quartierObject.code_Quartier"
          >
            <RouterLink
              :to="{
                name: 'quartier-id',
                params: { id: quartierObject.code_Quartier },
              }"
              >{{ quartierObject.libelle_Quartier }}</RouterLink
            >
          </li>
        </ul>
      </DisclosurePanel>
    </Disclosure>
  </section>
</template>
