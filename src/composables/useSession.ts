import { supabase } from '@/supabase'
import type { Session } from '@supabase/supabase-js'
import { computed, ref } from 'vue'

const session = ref<Session | null>(null)

supabase.auth.onAuthStateChange((_, _session) => {
  session.value = _session!
})

export function useSession() {
  const getSession = async () => {
    const { data, error } = await supabase.auth.getSession()
    if (data) {
      session.value = data.session!
    }
    if (error) {
      console.error('Can not get supabase session', error)
    }
  }

  const hasSession = computed<boolean>(() => {
    return session.value != null
  })
  return { session, getSession, hasSession }
}
