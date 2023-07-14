import { computed, onMounted, ref } from 'vue'
import { supabase } from '@/supabase'

const session = ref()

export function useSession() {
  onMounted(() => {
    supabase.auth.getSession().then(({ data }) => {
      session.value = data.session
    })

    supabase.auth.onAuthStateChange((_, _session) => {
      session.value = _session
    })
  })

  const hasSession = computed(() => {
    return !!session.value
  })

  const user = computed(() => {
    return session.value.user
  })

  return { hasSession, user }
}
