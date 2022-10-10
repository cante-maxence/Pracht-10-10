import { createApp } from "vue";
import App from "./App.vue";
import "./index.css";
import { createRouter, createWebHistory } from "vue-router";
import routes from "~pages";
import { plugin, defaultConfig } from "@formkit/vue";

const router = createRouter({
  history: createWebHistory(),
  routes,
});

const app = createApp(App);
app.use(router);
app.use(plugin, defaultConfig);
app.mount("#app");
