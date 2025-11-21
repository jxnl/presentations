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
      bg: 'bg-blue-50 dark:bg-blue-900/20',
      border: 'border-blue-200 dark:border-blue-800',
      text: 'text-blue-800 dark:text-blue-200',
      title: 'text-blue-900 dark:text-blue-100',
      icon: 'text-blue-600 dark:text-blue-400'
    },
    warning: {
      bg: 'bg-amber-50 dark:bg-amber-900/20',
      border: 'border-amber-200 dark:border-amber-800',
      text: 'text-amber-800 dark:text-amber-200',
      title: 'text-amber-900 dark:text-amber-100',
      icon: 'text-amber-600 dark:text-amber-400'
    },
    success: {
      bg: 'bg-emerald-50 dark:bg-emerald-900/20',
      border: 'border-emerald-200 dark:border-emerald-800',
      text: 'text-emerald-800 dark:text-emerald-200',
      title: 'text-emerald-900 dark:text-emerald-100',
      icon: 'text-emerald-600 dark:text-emerald-400'
    },
    error: {
      bg: 'bg-rose-50 dark:bg-rose-900/20',
      border: 'border-rose-200 dark:border-rose-800',
      text: 'text-rose-800 dark:text-rose-200',
      title: 'text-rose-900 dark:text-rose-100',
      icon: 'text-rose-600 dark:text-rose-400'
    },
    tip: {
      bg: 'bg-violet-50 dark:bg-violet-900/20',
      border: 'border-violet-200 dark:border-violet-800',
      text: 'text-violet-800 dark:text-violet-200',
      title: 'text-violet-900 dark:text-violet-100',
      icon: 'text-violet-600 dark:text-violet-400'
    },
    note: {
      bg: 'bg-gray-50 dark:bg-gray-800/40',
      border: 'border-gray-200 dark:border-gray-700',
      text: 'text-gray-800 dark:text-gray-300',
      title: 'text-gray-900 dark:text-gray-100',
      icon: 'text-gray-600 dark:text-gray-400'
    }
  }
  return configs[props.type]
})
</script>

<template>
  <div 
    :class="[
      'flex gap-3 p-4 rounded-md border transition-colors',
      config.bg,
      config.border
    ]"
  >
    <div :class="['flex-shrink-0 text-lg mt-0.5', config.icon]">
      <span v-if="type === 'info'" class="i-carbon:information-filled" />
      <span v-else-if="type === 'warning'" class="i-carbon:warning-filled" />
      <span v-else-if="type === 'success'" class="i-carbon:checkmark-filled" />
      <span v-else-if="type === 'error'" class="i-carbon:error-filled" />
      <span v-else-if="type === 'tip'" class="i-carbon:idea" />
      <span v-else class="i-carbon:notebook" />
    </div>
    <div :class="['flex-1 min-w-0', config.text]">
      <div v-if="title" :class="['font-semibold text-sm mb-1', config.title]">
        {{ title }}
      </div>
      <div class="text-sm leading-relaxed opacity-90">
        <slot />
      </div>
    </div>
  </div>
</template>
