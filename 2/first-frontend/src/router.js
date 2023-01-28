import Vue from "vue";
import Router from "vue-router";
import AppHeader from "./layout/AppHeader";
import AppFooter from "./layout/AppFooter";
import Components from "./views/Components.vue";
import Landing from "./views/Landing.vue";
import Login from "./views/Login.vue";
import Register from "./views/Register.vue";
import Profile from "./views/Profile.vue";
import Masini from "./views/Masini.vue";
import Locatii from "./views/Locatii.vue";
import Rezerva from "./views/Rezerva.vue";
import Harta from "./views/Harta.vue";

Vue.use(Router);

export default new Router({
  linkExactActiveClass: "active",
  routes: [
    {
      path: "/",
      name: "components",
      components: {
        header: AppHeader,
        default: Components,
        footer: AppFooter
      }
    },
    {
      path: "/landing",
      name: "landing",
      components: {
        header: AppHeader,
        default: Landing,
        footer: AppFooter
      }
    },
    {
      path: "/login",
      name: "login",
      components: {
        header: AppHeader,
        default: Login,
        footer: AppFooter
      }
    },
    {
      path: "/register",
      name: "register",
      components: {
        header: AppHeader,
        default: Register,
        footer: AppFooter
      }
    },
    {
      path: "/profile",
      name: "profile",
      components: {
        header: AppHeader,
        default: Profile,
        footer: AppFooter
      }
    },

      {
          path: "/masini",
          name: "masini",
          components: {
              header: AppHeader,
              default: Masini,
              footer: AppFooter
          }
      },
      {
          path: "/locatii",
          name: "locatii",
          components: {
              header: AppHeader,
              default: Locatii,
              footer: AppFooter
          }
      },
      {
          path: "/rezerva",
          name: "rezerva",
          components: {
              header: AppHeader,
              default: Rezerva,
              footer: AppFooter
          }
      },
      {
          path: "/harta",
          name: "harta",
          components: {
              header: AppHeader,
              default: Harta,
              footer: AppFooter
          }
      }
  ],
  scrollBehavior: to => {
    if (to.hash) {
      return { selector: to.hash };
    } else {
      return { x: 0, y: 0 };
    }
  }
});
