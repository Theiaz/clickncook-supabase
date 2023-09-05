import { supabase } from '@/supabase'
import { ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'

export function useAuth() {
  const loading = ref<boolean>(false)
  const router = useRouter()
  const route = useRoute()

  const logout = async () => {
    console.log('logout')
    try {
      loading.value = true
      const { error } = await supabase.auth.signOut()
      if (error) throw error
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message)
      }
    } finally {
      loading.value = false
      router.push({ name: 'login' })
    }
  }

  const login = async (email: string, password: string) => {
    console.log('login')
    try {
      loading.value = true
      const { error } = await supabase.auth.signInWithPassword({
        email: email,
        password: password
      })
      if (error) throw error
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message)
      }
    } finally {
      loading.value = false

      const url: string = route.query.redirect?.toString() || '/'
      router.push(url)
    }
  }

  const register = async (email: string, password: string) => {
    try {
      loading.value = true
      const { error } = await supabase.auth.signUp({
        email: email,
        password: password
      })
      if (error) throw error
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message)
      }
    } finally {
      alert('Please confirm your registration via email.')
      loading.value = false
    }
  }

  return { loading, login, logout, register }
}
