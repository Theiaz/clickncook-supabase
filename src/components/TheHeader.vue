<script setup lang="ts">
import AddDocument from '@/components/icons/AddDocument.vue'
import ClicknCookIcon from '@/components/icons/ClicknCookIcon.vue'
import LoginIcon from '@/components/icons/LoginIcon.vue'
import LogoutIcon from '@/components/icons/LogoutIcon.vue'
import RecipeListIcon from '@/components/icons/RecipeListIcon.vue'
import { useAuth } from '@/composables/useAuth'
import { useUser } from '@/composables/useUser'
import Button from './ui/button/Button.vue'

const { isAuthenticated } = useUser()
const { logout } = useAuth()
</script>
<template>
  <header
    class="flex gap-4 justify-end items-center px-8 py-2 text-primary sticky top-0 bg-white z-10"
  >
    <router-link class="mr-auto text-primary-text flex items-center gap-2" :to="{ name: 'home' }">
      <ClicknCookIcon />
      <div class="flex items-end italic flex-nowrap" data-test="claim">
        <span class="font-bold">C</span>
        <span>lick &nbsp;</span>
        <span class="font-bold">'n' &nbsp;</span>
        <span class="font-bold">C</span>
        <span>ook</span>
      </div>
    </router-link>
    <router-link :to="{ name: 'newRecipe' }" v-slot="{ href, navigate }">
      <Button variant="outline" size="icon" :href="href" @click="navigate" data-test="new-recipe">
        <AddDocument />
      </Button>
    </router-link>
    <router-link :to="{ name: 'myRecipes' }" v-slot="{ href, navigate }">
      <Button variant="outline" size="icon" :href="href" @click="navigate">
        <RecipeListIcon />
      </Button>
    </router-link>
    <router-link v-if="!isAuthenticated" :to="{ name: 'login' }" v-slot="{ href, navigate }">
      <Button variant="outline" size="icon" :href="href" @click="navigate" data-test="login-button">
        <LoginIcon />
      </Button>
    </router-link>
    <Button variant="outline" size="icon" v-else @click="logout" data-test="logout-button">
      <LogoutIcon />
    </Button>
  </header>
</template>
