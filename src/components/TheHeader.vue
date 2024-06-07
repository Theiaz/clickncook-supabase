<script setup lang="ts">
import AddDocument from '@/components/icons/AddDocument.vue'
import ClicknCookIcon from '@/components/icons/ClicknCookIcon.vue'
import LoginIcon from '@/components/icons/LoginIcon.vue'
import LogoutIcon from '@/components/icons/LogoutIcon.vue'
import RecipeListIcon from '@/components/icons/RecipeListIcon.vue'
import InstallButton from '@/components/installation/InstallButton.vue'
import { useAuth } from '@/composables/useAuth'
import { useUser } from '@/composables/useUser'
import Button from './ui/button/Button.vue'

const { isAuthenticated } = useUser()
const { logout } = useAuth()
</script>
<template>
  <header class="px-8 py-2 text-primary sticky top-0 bg-white z-10">
    <nav class="flex gap-4 justify-end items-center">
      <ul class="mr-auto">
        <router-link class="text-primary-text flex items-center gap-2" :to="{ name: 'home' }">
          <ClicknCookIcon />
          <div class="flex italic flex-nowrap" data-test="claim">
            <span class="font-bold">C</span>
            <span>lick &nbsp;</span>
            <span class="font-bold">'n' &nbsp;</span>
            <span class="font-bold">C</span>
            <span>ook</span>
          </div>
        </router-link>
      </ul>
      <ul>
        <InstallButton />
      </ul>
      <ul>
        <router-link :to="{ name: 'newRecipe' }" v-slot="{ href, navigate }">
          <Button
            variant="outline"
            size="icon"
            :href="href"
            @click="navigate"
            data-test="new-recipe"
          >
            <AddDocument />
          </Button>
        </router-link>
      </ul>
      <ul>
        <router-link :to="{ name: 'myRecipes' }" v-slot="{ href, navigate }">
          <Button variant="outline" size="icon" :href="href" @click="navigate">
            <RecipeListIcon />
          </Button>
        </router-link>
      </ul>
      <ul>
        <router-link v-if="!isAuthenticated" :to="{ name: 'login' }" v-slot="{ href, navigate }">
          <Button
            variant="outline"
            size="icon"
            :href="href"
            @click="navigate"
            data-test="login-button"
          >
            <LoginIcon />
          </Button>
        </router-link>
        <Button v-else variant="outline" size="icon" @click="logout" data-test="logout-button">
          <LogoutIcon />
        </Button>
      </ul>
    </nav>
  </header>
</template>
