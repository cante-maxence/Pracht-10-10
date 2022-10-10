<template>
  <ul>
    <li>
      <routerLink to="/">Accueil</routerLink>
    </li>
    <li>
      <routerLink to="/simple"
        >Deux composants recevant "simplement" les valeurs</routerLink
      >
    </li>
    <li>
      <routerLink to="/liste">listing depuis import</routerLink>
    </li>
    <li>
      <routerLink to="/liste-fetch">listing "dynamique" avec fetch</routerLink>
    </li>
    <li>
      <routerLink to="/liste-supabase"
        >listing de la table sur Supabase</routerLink
      >
    </li>
    <li>
      Offres :
      <ul>
        <li><routerLink to="/offre/0">index : 0</routerLink></li>
        <li><routerLink to="/offre/1">index : 1</routerLink></li>
      </ul>
    </li>
    <li><routerLink to="/edit/new">Edition :Nouvelle offre</routerLink></li>
    <li><routerLink to="/quartier">Liste des quartiers</routerLink></li>
    <li>
      <router-link class="text-red-600 underline" to="/login-logout">
        Login/logout
      </router-link>
    </li>
  </ul>
  <div class="p-2">
    <Suspense>
      <routerView />
      <template #fallback> Chargement... depuis "RouterView..." </template>
    </Suspense>
  </div>
</template>
<script setup lang="ts"></script>
