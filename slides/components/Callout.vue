<script setup lang="ts">
import { computed } from 'vue'

const props = withDefaults(defineProps<{
  type?: 'info' | 'warning' | 'success' | 'error' | 'tip' | 'note'
  title?: string
}>(), {
  type: 'info'
})

const config = computed(() => {
  const configs = {
    info: {
      bg: 'bg-blue-400/10 dark:bg-blue-400/10',
      border: 'border-blue-400/20 dark:border-blue-400/30',
      text: 'text-blue-700 dark:text-blue-200',
      title: 'text-blue-900 dark:text-blue-100',
      icon: 'text-blue-600 dark:text-blue-400'
    },
    warning: {
      bg: 'bg-amber-400/10 dark:bg-amber-400/10',
      border: 'border-amber-400/20 dark:border-amber-400/30',
      text: 'text-amber-800 dark:text-amber-200',
      title: 'text-amber-900 dark:text-amber-100',
      icon: 'text-amber-600 dark:text-amber-400'
    },
    success: {
      bg: 'bg-emerald-400/10 dark:bg-emerald-400/10',
      border: 'border-emerald-400/20 dark:border-emerald-400/30',
      text: 'text-emerald-800 dark:text-emerald-200',
      title: 'text-emerald-900 dark:text-emerald-100',
      icon: 'text-emerald-600 dark:text-emerald-400'
    },
    error: {
      bg: 'bg-rose-400/10 dark:bg-rose-400/10',
      border: 'border-rose-400/20 dark:border-rose-400/30',
      text: 'text-rose-800 dark:text-rose-200',
      title: 'text-rose-900 dark:text-rose-100',
      icon: 'text-rose-600 dark:text-rose-400'
    },
    tip: {
      bg: 'bg-violet-400/10 dark:bg-violet-400/10',
      border: 'border-violet-400/20 dark:border-violet-400/30',
      text: 'text-violet-700 dark:text-violet-200',
      title: 'text-violet-900 dark:text-violet-100',
      icon: 'text-violet-600 dark:text-violet-400'
    },
    note: {
      bg: 'bg-slate-400/10 dark:bg-slate-400/10',
      border: 'border-slate-400/20 dark:border-slate-400/30',
      text: 'text-slate-700 dark:text-slate-200',
      title: 'text-slate-900 dark:text-slate-100',
      icon: 'text-slate-600 dark:text-slate-400'
    }
  }
  return configs[props.type]
})
</script>

<template>
  <div 
    :class="[
      'flex gap-3 p-4 rounded-xl border backdrop-blur-sm transition-colors',
      config.bg,
      config.border
    ]"
  >
    <div :class="['flex-shrink-0 text-xl mt-0.5', config.icon]">
      <span v-if="type === 'info'" class="i-carbon:information-filled" />
      <span v-else-if="type === 'warning'" class="i-carbon:warning-filled" />
      <span v-else-if="type === 'success'" class="i-carbon:checkmark-filled" />
      <span v-else-if="type === 'error'" class="i-carbon:error-filled" />
      <span v-else-if="type === 'tip'" class="i-carbon:idea" />
      <span v-else class="i-carbon:notebook" />
    </div>
    <div :class="['flex-1 min-w-0', config.text]">
      <div v-if="title" :class="['font-bold text-sm mb-1', config.title]">
        {{ title }}
      </div>
      <div class="text-sm leading-relaxed opacity-90">
        <slot />
      </div>
    </div>
  </div>
</template>
